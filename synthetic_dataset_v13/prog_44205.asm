; DESCRIPTION: Creates a red rectangular region at (204, 49) spanning 46 by 118 pixels.
; PLAN: r0=204(x), r1=49(y), r2=46(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 49
LDI r2, 46
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a red rectangular region at (288, 37) spanning 118 by 43 pixels.
; PLAN: r0=288(x), r1=37(y), r2=118(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 37
LDI r2, 118
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

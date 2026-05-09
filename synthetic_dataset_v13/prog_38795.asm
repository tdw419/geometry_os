; DESCRIPTION: Creates a red rectangular region at (49, 66) spanning 118 by 55 pixels.
; PLAN: r0=49(x), r1=66(y), r2=118(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 66
LDI r2, 118
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

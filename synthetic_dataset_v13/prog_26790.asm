; DESCRIPTION: Creates a purple rectangular region at (292, 52) spanning 33 by 118 pixels.
; PLAN: r0=292(x), r1=52(y), r2=33(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 52
LDI r2, 33
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

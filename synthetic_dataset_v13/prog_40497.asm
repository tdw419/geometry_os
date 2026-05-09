; DESCRIPTION: Creates a purple rectangular region at (340, 161) spanning 118 by 75 pixels.
; PLAN: r0=340(x), r1=161(y), r2=118(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 161
LDI r2, 118
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

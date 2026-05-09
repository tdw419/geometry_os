; DESCRIPTION: Creates a purple rectangular region at (355, 89) spanning 65 by 75 pixels.
; PLAN: r0=355(x), r1=89(y), r2=65(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 89
LDI r2, 65
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (89, 123) spanning 85 by 45 pixels.
; PLAN: r0=89(x), r1=123(y), r2=85(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 123
LDI r2, 85
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue box of size 45x110 starting at (184, 85).
; PLAN: r0=184(x), r1=85(y), r2=45(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 85
LDI r2, 45
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

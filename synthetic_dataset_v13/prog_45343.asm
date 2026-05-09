; DESCRIPTION: Renders a purple box of size 88x22 starting at (201, 229).
; PLAN: r0=201(x), r1=229(y), r2=88(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 229
LDI r2, 88
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

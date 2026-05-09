; DESCRIPTION: Renders a purple box of size 118x110 starting at (236, 63).
; PLAN: r0=236(x), r1=63(y), r2=118(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 63
LDI r2, 118
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

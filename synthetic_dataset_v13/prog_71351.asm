; DESCRIPTION: Renders a purple box of size 63x22 starting at (12, 145).
; PLAN: r0=12(x), r1=145(y), r2=63(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 145
LDI r2, 63
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple box of size 110x63 starting at (278, 79).
; PLAN: r0=278(x), r1=79(y), r2=110(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 79
LDI r2, 110
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

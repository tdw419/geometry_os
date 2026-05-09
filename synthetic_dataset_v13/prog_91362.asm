; DESCRIPTION: Renders a purple box of size 10x84 starting at (55, 144).
; PLAN: r0=55(x), r1=144(y), r2=10(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 144
LDI r2, 10
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

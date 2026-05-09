; DESCRIPTION: Renders a purple box of size 15x13 starting at (63, 181).
; PLAN: r0=63(x), r1=181(y), r2=15(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 181
LDI r2, 15
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

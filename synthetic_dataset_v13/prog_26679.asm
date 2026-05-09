; DESCRIPTION: Renders a purple box of size 14x90 starting at (89, 63).
; PLAN: r0=89(x), r1=63(y), r2=14(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 63
LDI r2, 14
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

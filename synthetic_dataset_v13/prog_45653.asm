; DESCRIPTION: Renders a purple box of size 87x110 starting at (358, 44).
; PLAN: r0=358(x), r1=44(y), r2=87(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 44
LDI r2, 87
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

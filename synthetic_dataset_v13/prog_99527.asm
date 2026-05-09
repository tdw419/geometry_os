; DESCRIPTION: Renders a purple box of size 98x97 starting at (360, 147).
; PLAN: r0=360(x), r1=147(y), r2=98(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 147
LDI r2, 98
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

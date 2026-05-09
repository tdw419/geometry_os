; DESCRIPTION: Renders a purple box of size 106x97 starting at (251, 155).
; PLAN: r0=251(x), r1=155(y), r2=106(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 155
LDI r2, 106
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

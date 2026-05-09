; DESCRIPTION: Renders a purple box of size 20x46 starting at (44, 97).
; PLAN: r0=44(x), r1=97(y), r2=20(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 97
LDI r2, 20
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

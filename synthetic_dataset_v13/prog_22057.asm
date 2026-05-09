; DESCRIPTION: Renders a purple box of size 36x29 starting at (390, 211).
; PLAN: r0=390(x), r1=211(y), r2=36(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 211
LDI r2, 36
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

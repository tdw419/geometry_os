; DESCRIPTION: Renders a purple box of size 110x78 starting at (332, 132).
; PLAN: r0=332(x), r1=132(y), r2=110(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 132
LDI r2, 110
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

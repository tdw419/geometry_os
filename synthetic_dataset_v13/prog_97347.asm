; DESCRIPTION: Renders a purple box of size 84x78 starting at (329, 110).
; PLAN: r0=329(x), r1=110(y), r2=84(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 110
LDI r2, 84
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

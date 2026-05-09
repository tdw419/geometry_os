; DESCRIPTION: Renders a purple box of size 27x81 starting at (319, 110).
; PLAN: r0=319(x), r1=110(y), r2=27(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 110
LDI r2, 27
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

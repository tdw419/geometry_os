; DESCRIPTION: Renders a purple box of size 80x46 starting at (51, 99).
; PLAN: r0=51(x), r1=99(y), r2=80(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 99
LDI r2, 80
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

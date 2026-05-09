; DESCRIPTION: Renders a purple box of size 18x51 starting at (438, 123).
; PLAN: r0=438(x), r1=123(y), r2=18(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 123
LDI r2, 18
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

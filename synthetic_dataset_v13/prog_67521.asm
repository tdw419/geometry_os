; DESCRIPTION: Renders a purple box of size 91x51 starting at (65, 4).
; PLAN: r0=65(x), r1=4(y), r2=91(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 4
LDI r2, 91
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

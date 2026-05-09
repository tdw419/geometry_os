; DESCRIPTION: Renders a purple box of size 74x51 starting at (84, 29).
; PLAN: r0=84(x), r1=29(y), r2=74(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 29
LDI r2, 74
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

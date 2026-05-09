; DESCRIPTION: Renders a purple box of size 51x95 starting at (377, 9).
; PLAN: r0=377(x), r1=9(y), r2=51(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 9
LDI r2, 51
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

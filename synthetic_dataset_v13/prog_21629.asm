; DESCRIPTION: Renders a purple box of size 14x102 starting at (51, 9).
; PLAN: r0=51(x), r1=9(y), r2=14(width), r3=102(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 9
LDI r2, 14
LDI r3, 102
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

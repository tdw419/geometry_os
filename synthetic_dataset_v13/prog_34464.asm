; DESCRIPTION: Renders a purple box of size 34x51 starting at (381, 43).
; PLAN: r0=381(x), r1=43(y), r2=34(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 43
LDI r2, 34
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple box of size 67x51 starting at (241, 26).
; PLAN: r0=241(x), r1=26(y), r2=67(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 26
LDI r2, 67
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple box of size 51x14 starting at (44, 95).
; PLAN: r0=44(x), r1=95(y), r2=51(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 95
LDI r2, 51
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

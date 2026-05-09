; DESCRIPTION: Renders a purple box of size 19x89 starting at (221, 1).
; PLAN: r0=221(x), r1=1(y), r2=19(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 1
LDI r2, 19
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

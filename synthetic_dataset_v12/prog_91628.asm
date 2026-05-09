; DESCRIPTION: Renders a purple box of size 96x89 starting at (39, 18).
; PLAN: r0=39(x), r1=18(y), r2=96(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 18
LDI r2, 96
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

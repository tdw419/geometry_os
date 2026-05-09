; DESCRIPTION: Renders a purple box of size 25x94 starting at (189, 11).
; PLAN: r0=189(x), r1=11(y), r2=25(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 11
LDI r2, 25
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

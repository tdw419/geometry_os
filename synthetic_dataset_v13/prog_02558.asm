; DESCRIPTION: Renders a purple box of size 81x112 starting at (323, 71).
; PLAN: r0=323(x), r1=71(y), r2=81(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 71
LDI r2, 81
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

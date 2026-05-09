; DESCRIPTION: Renders a purple box of size 114x14 starting at (36, 129).
; PLAN: r0=36(x), r1=129(y), r2=114(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 129
LDI r2, 114
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

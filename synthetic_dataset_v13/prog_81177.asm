; DESCRIPTION: Renders a purple box of size 17x114 starting at (269, 132).
; PLAN: r0=269(x), r1=132(y), r2=17(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 132
LDI r2, 17
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a purple box of size 36x114 starting at (23, 114).
; PLAN: r0=23(x), r1=114(y), r2=36(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 114
LDI r2, 36
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

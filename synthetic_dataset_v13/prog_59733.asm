; DESCRIPTION: Renders a purple box of size 26x101 starting at (204, 131).
; PLAN: r0=204(x), r1=131(y), r2=26(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 131
LDI r2, 26
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

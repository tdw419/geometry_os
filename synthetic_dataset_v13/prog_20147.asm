; DESCRIPTION: Renders a blue box of size 19x101 starting at (36, 27).
; PLAN: r0=36(x), r1=27(y), r2=19(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 27
LDI r2, 19
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

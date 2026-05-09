; DESCRIPTION: Renders a blue box of size 114x73 starting at (257, 181).
; PLAN: r0=257(x), r1=181(y), r2=114(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 181
LDI r2, 114
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

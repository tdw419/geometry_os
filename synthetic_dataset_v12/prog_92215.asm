; DESCRIPTION: Renders a blue box of size 114x31 starting at (97, 189).
; PLAN: r0=97(x), r1=189(y), r2=114(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 189
LDI r2, 114
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Renders a blue box of size 19x24 starting at (272, 114).
; PLAN: r0=272(x), r1=114(y), r2=19(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 114
LDI r2, 19
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

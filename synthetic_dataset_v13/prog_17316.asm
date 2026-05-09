; DESCRIPTION: Renders a blue box of size 58x17 starting at (132, 73).
; PLAN: r0=132(x), r1=73(y), r2=58(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 73
LDI r2, 58
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

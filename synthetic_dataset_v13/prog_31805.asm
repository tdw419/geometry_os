; DESCRIPTION: Renders a blue box of size 110x106 starting at (91, 132).
; PLAN: r0=91(x), r1=132(y), r2=110(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 132
LDI r2, 110
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

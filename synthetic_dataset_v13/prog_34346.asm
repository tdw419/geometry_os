; DESCRIPTION: Renders a blue box of size 58x106 starting at (172, 87).
; PLAN: r0=172(x), r1=87(y), r2=58(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 87
LDI r2, 58
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

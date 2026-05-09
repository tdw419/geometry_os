; DESCRIPTION: Renders a blue box of size 56x114 starting at (411, 22).
; PLAN: r0=411(x), r1=22(y), r2=56(width), r3=114(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 22
LDI r2, 56
LDI r3, 114
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

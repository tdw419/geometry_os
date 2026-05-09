; DESCRIPTION: Renders a blue box of size 114x78 starting at (23, 162).
; PLAN: r0=23(x), r1=162(y), r2=114(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 162
LDI r2, 114
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

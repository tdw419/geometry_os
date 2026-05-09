; DESCRIPTION: Renders a blue box of size 94x22 starting at (101, 26).
; PLAN: r0=101(x), r1=26(y), r2=94(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 26
LDI r2, 94
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

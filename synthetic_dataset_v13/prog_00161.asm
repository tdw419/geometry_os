; DESCRIPTION: Renders a blue box of size 23x58 starting at (22, 8).
; PLAN: r0=22(x), r1=8(y), r2=23(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 8
LDI r2, 23
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

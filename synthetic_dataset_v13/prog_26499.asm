; DESCRIPTION: Renders a blue box of size 88x37 starting at (123, 83).
; PLAN: r0=123(x), r1=83(y), r2=88(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 83
LDI r2, 88
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

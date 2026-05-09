; DESCRIPTION: Renders a blue box of size 56x54 starting at (123, 105).
; PLAN: r0=123(x), r1=105(y), r2=56(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 105
LDI r2, 56
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

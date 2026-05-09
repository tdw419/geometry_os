; DESCRIPTION: Renders a blue box of size 12x17 starting at (377, 196).
; PLAN: r0=377(x), r1=196(y), r2=12(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 196
LDI r2, 12
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

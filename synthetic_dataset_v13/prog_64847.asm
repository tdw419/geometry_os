; DESCRIPTION: Renders a blue box of size 81x111 starting at (188, 102).
; PLAN: r0=188(x), r1=102(y), r2=81(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 102
LDI r2, 81
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

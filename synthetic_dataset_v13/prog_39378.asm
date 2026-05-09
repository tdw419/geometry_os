; DESCRIPTION: Renders a blue box of size 53x102 starting at (369, 81).
; PLAN: r0=369(x), r1=81(y), r2=53(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 81
LDI r2, 53
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

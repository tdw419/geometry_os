; DESCRIPTION: Renders a blue box of size 35x69 starting at (81, 90).
; PLAN: r0=81(x), r1=90(y), r2=35(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 90
LDI r2, 35
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

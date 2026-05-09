; DESCRIPTION: Renders a purple box of size 53x69 starting at (185, 136).
; PLAN: r0=185(x), r1=136(y), r2=53(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 136
LDI r2, 53
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

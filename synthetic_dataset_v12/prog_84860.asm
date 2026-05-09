; DESCRIPTION: Renders a blue box of size 119x105 starting at (377, 112).
; PLAN: r0=377(x), r1=112(y), r2=119(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 112
LDI r2, 119
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

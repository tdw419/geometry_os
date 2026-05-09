; DESCRIPTION: Renders a blue box of size 12x51 starting at (356, 203).
; PLAN: r0=356(x), r1=203(y), r2=12(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 203
LDI r2, 12
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

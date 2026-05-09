; DESCRIPTION: Places a blue 17x88 rectangle at position (136, 119).
; PLAN: r0=136(x), r1=119(y), r2=17(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 119
LDI r2, 17
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 88x66 rectangle at position (240, 155).
; PLAN: r0=240(x), r1=155(y), r2=88(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 155
LDI r2, 88
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

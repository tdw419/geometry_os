; DESCRIPTION: Places a blue 78x84 rectangle at position (283, 88).
; PLAN: r0=283(x), r1=88(y), r2=78(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 88
LDI r2, 78
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

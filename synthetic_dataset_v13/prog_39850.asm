; DESCRIPTION: Places a blue 91x80 rectangle at position (178, 136).
; PLAN: r0=178(x), r1=136(y), r2=91(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 136
LDI r2, 91
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

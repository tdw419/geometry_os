; DESCRIPTION: Places a blue 91x88 rectangle at position (337, 64).
; PLAN: r0=337(x), r1=64(y), r2=91(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 64
LDI r2, 91
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

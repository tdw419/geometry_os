; DESCRIPTION: Places a blue 64x68 rectangle at position (72, 137).
; PLAN: r0=72(x), r1=137(y), r2=64(width), r3=68(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 137
LDI r2, 64
LDI r3, 68
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 33x87 rectangle at position (402, 157).
; PLAN: r0=402(x), r1=157(y), r2=33(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 157
LDI r2, 33
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

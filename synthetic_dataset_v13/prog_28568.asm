; DESCRIPTION: Places a blue 101x87 rectangle at position (256, 69).
; PLAN: r0=256(x), r1=69(y), r2=101(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 69
LDI r2, 101
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

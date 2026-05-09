; DESCRIPTION: Places a blue 30x37 rectangle at position (32, 147).
; PLAN: r0=32(x), r1=147(y), r2=30(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 147
LDI r2, 30
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 32x37 rectangle at position (351, 134).
; PLAN: r0=351(x), r1=134(y), r2=32(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 134
LDI r2, 32
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

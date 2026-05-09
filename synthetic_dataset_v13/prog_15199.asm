; DESCRIPTION: Places a blue 48x37 rectangle at position (87, 64).
; PLAN: r0=87(x), r1=64(y), r2=48(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 64
LDI r2, 48
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

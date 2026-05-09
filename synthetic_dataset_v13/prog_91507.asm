; DESCRIPTION: Places a blue 83x115 rectangle at position (256, 128).
; PLAN: r0=256(x), r1=128(y), r2=83(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 128
LDI r2, 83
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

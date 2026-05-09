; DESCRIPTION: Places a blue 64x83 rectangle at position (373, 15).
; PLAN: r0=373(x), r1=15(y), r2=64(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 15
LDI r2, 64
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

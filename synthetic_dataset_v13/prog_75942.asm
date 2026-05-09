; DESCRIPTION: Places a blue 83x100 rectangle at position (225, 128).
; PLAN: r0=225(x), r1=128(y), r2=83(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 128
LDI r2, 83
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

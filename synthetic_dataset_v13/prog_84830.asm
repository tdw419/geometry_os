; DESCRIPTION: Places a blue 80x12 rectangle at position (325, 106).
; PLAN: r0=325(x), r1=106(y), r2=80(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 106
LDI r2, 80
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

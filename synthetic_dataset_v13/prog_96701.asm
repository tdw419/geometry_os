; DESCRIPTION: Places a blue 52x104 rectangle at position (337, 80).
; PLAN: r0=337(x), r1=80(y), r2=52(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 80
LDI r2, 52
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

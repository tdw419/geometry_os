; DESCRIPTION: Places a blue 35x12 rectangle at position (428, 80).
; PLAN: r0=428(x), r1=80(y), r2=35(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 80
LDI r2, 35
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

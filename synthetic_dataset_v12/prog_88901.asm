; DESCRIPTION: Places a blue 75x86 rectangle at position (331, 35).
; PLAN: r0=331(x), r1=35(y), r2=75(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 35
LDI r2, 75
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 15x36 rectangle at position (331, 63).
; PLAN: r0=331(x), r1=63(y), r2=15(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 63
LDI r2, 15
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 83x67 rectangle at position (392, 35).
; PLAN: r0=392(x), r1=35(y), r2=83(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 35
LDI r2, 83
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

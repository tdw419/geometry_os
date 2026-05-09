; DESCRIPTION: Places a blue 13x88 rectangle at position (83, 67).
; PLAN: r0=83(x), r1=67(y), r2=13(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 67
LDI r2, 13
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

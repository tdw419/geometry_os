; DESCRIPTION: Places a blue 104x63 rectangle at position (381, 63).
; PLAN: r0=381(x), r1=63(y), r2=104(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 63
LDI r2, 104
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a blue 104x23 rectangle at position (12, 110).
; PLAN: r0=12(x), r1=110(y), r2=104(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 110
LDI r2, 104
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

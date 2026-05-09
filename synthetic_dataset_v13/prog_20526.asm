; DESCRIPTION: Places a blue 91x104 rectangle at position (261, 35).
; PLAN: r0=261(x), r1=35(y), r2=91(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 35
LDI r2, 91
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

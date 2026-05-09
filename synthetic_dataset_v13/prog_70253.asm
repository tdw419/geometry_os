; DESCRIPTION: Places a blue 54x56 rectangle at position (332, 104).
; PLAN: r0=332(x), r1=104(y), r2=54(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 104
LDI r2, 54
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

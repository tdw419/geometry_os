; DESCRIPTION: Places a black 104x84 rectangle at position (390, 101).
; PLAN: r0=390(x), r1=101(y), r2=104(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 101
LDI r2, 104
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

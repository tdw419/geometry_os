; DESCRIPTION: Places a purple 100x104 rectangle at position (220, 37).
; PLAN: r0=220(x), r1=37(y), r2=100(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 37
LDI r2, 100
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

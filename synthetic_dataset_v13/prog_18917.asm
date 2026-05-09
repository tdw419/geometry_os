; DESCRIPTION: Places a purple 44x104 rectangle at position (447, 145).
; PLAN: r0=447(x), r1=145(y), r2=44(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 145
LDI r2, 44
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

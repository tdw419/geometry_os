; DESCRIPTION: Places a purple 77x104 rectangle at position (22, 122).
; PLAN: r0=22(x), r1=122(y), r2=77(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 122
LDI r2, 77
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

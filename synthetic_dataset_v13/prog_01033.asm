; DESCRIPTION: Places a purple 45x104 rectangle at position (229, 147).
; PLAN: r0=229(x), r1=147(y), r2=45(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 147
LDI r2, 45
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

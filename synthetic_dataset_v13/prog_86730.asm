; DESCRIPTION: Places a purple 104x49 rectangle at position (122, 94).
; PLAN: r0=122(x), r1=94(y), r2=104(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 94
LDI r2, 104
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

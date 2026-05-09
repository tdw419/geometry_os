; DESCRIPTION: Places a black 45x36 rectangle at position (126, 104).
; PLAN: r0=126(x), r1=104(y), r2=45(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 104
LDI r2, 45
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

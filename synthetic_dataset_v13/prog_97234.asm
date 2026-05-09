; DESCRIPTION: Places a black 64x104 rectangle at position (296, 68).
; PLAN: r0=296(x), r1=68(y), r2=64(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 68
LDI r2, 64
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

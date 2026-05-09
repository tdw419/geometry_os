; DESCRIPTION: Places a black 72x104 rectangle at position (128, 128).
; PLAN: r0=128(x), r1=128(y), r2=72(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 128
LDI r2, 72
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black 104x56 rectangle at position (278, 135).
; PLAN: r0=278(x), r1=135(y), r2=104(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 135
LDI r2, 104
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

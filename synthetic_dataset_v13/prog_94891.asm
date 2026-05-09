; DESCRIPTION: Places a black 77x104 rectangle at position (414, 94).
; PLAN: r0=414(x), r1=94(y), r2=77(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 94
LDI r2, 77
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

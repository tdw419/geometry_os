; DESCRIPTION: Places a black 104x59 rectangle at position (119, 191).
; PLAN: r0=119(x), r1=191(y), r2=104(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 191
LDI r2, 104
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

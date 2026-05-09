; DESCRIPTION: Places a black 104x13 rectangle at position (77, 108).
; PLAN: r0=77(x), r1=108(y), r2=104(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 108
LDI r2, 104
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

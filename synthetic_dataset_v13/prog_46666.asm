; DESCRIPTION: Places a black 84x14 rectangle at position (373, 45).
; PLAN: r0=373(x), r1=45(y), r2=84(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 45
LDI r2, 84
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

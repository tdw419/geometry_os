; DESCRIPTION: Places a black 45x83 rectangle at position (354, 40).
; PLAN: r0=354(x), r1=40(y), r2=45(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 40
LDI r2, 45
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

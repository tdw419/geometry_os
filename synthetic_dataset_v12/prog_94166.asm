; DESCRIPTION: Places a black 21x15 rectangle at position (375, 160).
; PLAN: r0=375(x), r1=160(y), r2=21(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 160
LDI r2, 21
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

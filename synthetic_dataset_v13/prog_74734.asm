; DESCRIPTION: Places a black 11x91 rectangle at position (261, 23).
; PLAN: r0=261(x), r1=23(y), r2=11(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 23
LDI r2, 11
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

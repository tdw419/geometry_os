; DESCRIPTION: Places a black 89x23 rectangle at position (17, 81).
; PLAN: r0=17(x), r1=81(y), r2=89(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 81
LDI r2, 89
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

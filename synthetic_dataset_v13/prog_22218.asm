; DESCRIPTION: Places a black 94x61 rectangle at position (332, 72).
; PLAN: r0=332(x), r1=72(y), r2=94(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 72
LDI r2, 94
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black 11x61 rectangle at position (324, 4).
; PLAN: r0=324(x), r1=4(y), r2=11(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 4
LDI r2, 11
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

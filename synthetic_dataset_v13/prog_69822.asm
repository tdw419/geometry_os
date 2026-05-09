; DESCRIPTION: Places a black 11x25 rectangle at position (358, 72).
; PLAN: r0=358(x), r1=72(y), r2=11(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 72
LDI r2, 11
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

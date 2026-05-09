; DESCRIPTION: Places a black 107x105 rectangle at position (376, 6).
; PLAN: r0=376(x), r1=6(y), r2=107(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 6
LDI r2, 107
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

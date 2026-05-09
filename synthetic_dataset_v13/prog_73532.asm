; DESCRIPTION: Places a black 59x107 rectangle at position (163, 122).
; PLAN: r0=163(x), r1=122(y), r2=59(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 122
LDI r2, 59
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

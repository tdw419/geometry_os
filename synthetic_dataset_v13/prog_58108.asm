; DESCRIPTION: Places a black 59x83 rectangle at position (258, 98).
; PLAN: r0=258(x), r1=98(y), r2=59(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 98
LDI r2, 59
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

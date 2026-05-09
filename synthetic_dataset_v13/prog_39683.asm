; DESCRIPTION: Places a black 59x16 rectangle at position (351, 98).
; PLAN: r0=351(x), r1=98(y), r2=59(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 98
LDI r2, 59
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

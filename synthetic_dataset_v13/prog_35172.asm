; DESCRIPTION: Places a black 83x23 rectangle at position (394, 122).
; PLAN: r0=394(x), r1=122(y), r2=83(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 122
LDI r2, 83
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

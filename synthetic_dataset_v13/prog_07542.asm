; DESCRIPTION: Places a black 66x108 rectangle at position (264, 122).
; PLAN: r0=264(x), r1=122(y), r2=66(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 122
LDI r2, 66
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

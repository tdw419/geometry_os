; DESCRIPTION: Places a black 90x94 rectangle at position (189, 45).
; PLAN: r0=189(x), r1=45(y), r2=90(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 45
LDI r2, 90
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

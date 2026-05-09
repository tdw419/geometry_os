; DESCRIPTION: Places a black 76x106 rectangle at position (195, 3).
; PLAN: r0=195(x), r1=3(y), r2=76(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 3
LDI r2, 76
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

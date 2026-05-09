; DESCRIPTION: Places a black 86x18 rectangle at position (133, 189).
; PLAN: r0=133(x), r1=189(y), r2=86(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 189
LDI r2, 86
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

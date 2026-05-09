; DESCRIPTION: Places a black 29x103 rectangle at position (318, 13).
; PLAN: r0=318(x), r1=13(y), r2=29(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 13
LDI r2, 29
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

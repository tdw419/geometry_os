; DESCRIPTION: Places a black 45x63 rectangle at position (274, 81).
; PLAN: r0=274(x), r1=81(y), r2=45(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 81
LDI r2, 45
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

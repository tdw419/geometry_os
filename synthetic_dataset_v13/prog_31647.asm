; DESCRIPTION: Places a black 57x69 rectangle at position (195, 145).
; PLAN: r0=195(x), r1=145(y), r2=57(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 145
LDI r2, 57
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

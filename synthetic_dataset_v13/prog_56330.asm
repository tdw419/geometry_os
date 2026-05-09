; DESCRIPTION: Places a black 60x33 rectangle at position (79, 26).
; PLAN: r0=79(x), r1=26(y), r2=60(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 26
LDI r2, 60
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

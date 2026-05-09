; DESCRIPTION: Places a black 66x63 rectangle at position (79, 100).
; PLAN: r0=79(x), r1=100(y), r2=66(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 100
LDI r2, 66
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

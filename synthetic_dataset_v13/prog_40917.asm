; DESCRIPTION: Places a black 79x82 rectangle at position (311, 106).
; PLAN: r0=311(x), r1=106(y), r2=79(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 106
LDI r2, 79
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

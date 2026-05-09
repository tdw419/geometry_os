; DESCRIPTION: Places a black 112x85 rectangle at position (311, 43).
; PLAN: r0=311(x), r1=43(y), r2=112(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 43
LDI r2, 112
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

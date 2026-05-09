; DESCRIPTION: Places a black 112x98 rectangle at position (139, 141).
; PLAN: r0=139(x), r1=141(y), r2=112(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 141
LDI r2, 112
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

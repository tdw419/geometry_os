; DESCRIPTION: Places a black 115x37 rectangle at position (121, 149).
; PLAN: r0=121(x), r1=149(y), r2=115(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 149
LDI r2, 115
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

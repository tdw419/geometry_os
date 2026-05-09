; DESCRIPTION: Places a black 115x26 rectangle at position (55, 121).
; PLAN: r0=55(x), r1=121(y), r2=115(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 121
LDI r2, 115
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

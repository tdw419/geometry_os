; DESCRIPTION: Places a black 75x73 rectangle at position (161, 53).
; PLAN: r0=161(x), r1=53(y), r2=75(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 53
LDI r2, 75
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

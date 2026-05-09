; DESCRIPTION: Places a black 10x73 rectangle at position (71, 105).
; PLAN: r0=71(x), r1=105(y), r2=10(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 105
LDI r2, 10
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

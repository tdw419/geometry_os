; DESCRIPTION: Places a black 119x73 rectangle at position (250, 181).
; PLAN: r0=250(x), r1=181(y), r2=119(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 181
LDI r2, 119
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

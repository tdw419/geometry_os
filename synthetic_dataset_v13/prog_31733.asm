; DESCRIPTION: Places a black 114x53 rectangle at position (106, 64).
; PLAN: r0=106(x), r1=64(y), r2=114(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 64
LDI r2, 114
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black 53x97 rectangle at position (109, 152).
; PLAN: r0=109(x), r1=152(y), r2=53(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 152
LDI r2, 53
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black 31x53 rectangle at position (423, 166).
; PLAN: r0=423(x), r1=166(y), r2=31(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 166
LDI r2, 31
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

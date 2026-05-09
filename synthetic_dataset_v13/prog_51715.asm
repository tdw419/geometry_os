; DESCRIPTION: Places a black 35x53 rectangle at position (438, 0).
; PLAN: r0=438(x), r1=0(y), r2=35(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 0
LDI r2, 35
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

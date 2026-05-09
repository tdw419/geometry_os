; DESCRIPTION: Places a black 40x53 rectangle at position (389, 13).
; PLAN: r0=389(x), r1=13(y), r2=40(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 13
LDI r2, 40
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

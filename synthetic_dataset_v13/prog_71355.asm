; DESCRIPTION: Places a black 98x53 rectangle at position (25, 119).
; PLAN: r0=25(x), r1=119(y), r2=98(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 119
LDI r2, 98
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

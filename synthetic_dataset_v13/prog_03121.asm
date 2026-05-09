; DESCRIPTION: Places a black 28x53 rectangle at position (26, 19).
; PLAN: r0=26(x), r1=19(y), r2=28(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 19
LDI r2, 28
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

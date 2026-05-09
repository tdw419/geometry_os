; DESCRIPTION: Places a black 66x13 rectangle at position (300, 74).
; PLAN: r0=300(x), r1=74(y), r2=66(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 74
LDI r2, 66
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

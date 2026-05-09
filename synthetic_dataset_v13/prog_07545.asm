; DESCRIPTION: Places a black 21x19 rectangle at position (227, 66).
; PLAN: r0=227(x), r1=66(y), r2=21(width), r3=19(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 66
LDI r2, 21
LDI r3, 19
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Places a black 18x89 rectangle at position (393, 129).
; PLAN: r0=393(x), r1=129(y), r2=18(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 129
LDI r2, 18
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

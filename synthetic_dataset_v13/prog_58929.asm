; DESCRIPTION: Places a black 26x94 rectangle at position (81, 89).
; PLAN: r0=81(x), r1=89(y), r2=26(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 89
LDI r2, 26
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

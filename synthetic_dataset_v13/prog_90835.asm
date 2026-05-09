; DESCRIPTION: Places a black 56x89 rectangle at position (355, 3).
; PLAN: r0=355(x), r1=3(y), r2=56(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 3
LDI r2, 56
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

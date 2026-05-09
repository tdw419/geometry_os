; DESCRIPTION: Places a black 88x89 rectangle at position (291, 84).
; PLAN: r0=291(x), r1=84(y), r2=88(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 84
LDI r2, 88
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

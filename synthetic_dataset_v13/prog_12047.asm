; DESCRIPTION: Places a yellow 15x89 rectangle at position (122, 52).
; PLAN: r0=122(x), r1=52(y), r2=15(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 52
LDI r2, 15
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

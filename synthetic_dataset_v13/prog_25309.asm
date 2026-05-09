; DESCRIPTION: Places a yellow 40x89 rectangle at position (14, 132).
; PLAN: r0=14(x), r1=132(y), r2=40(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 132
LDI r2, 40
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

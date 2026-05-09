; DESCRIPTION: Places a yellow 81x89 rectangle at position (44, 118).
; PLAN: r0=44(x), r1=118(y), r2=81(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 118
LDI r2, 81
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

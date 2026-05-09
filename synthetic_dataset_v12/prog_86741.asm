; DESCRIPTION: Places a red 36x89 rectangle at position (179, 114).
; PLAN: r0=179(x), r1=114(y), r2=36(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 114
LDI r2, 36
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

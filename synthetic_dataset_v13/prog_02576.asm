; DESCRIPTION: Places a red 97x22 rectangle at position (361, 89).
; PLAN: r0=361(x), r1=89(y), r2=97(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 89
LDI r2, 97
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

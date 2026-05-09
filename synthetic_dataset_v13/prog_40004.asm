; DESCRIPTION: Places a green 117x89 rectangle at position (3, 97).
; PLAN: r0=3(x), r1=97(y), r2=117(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 97
LDI r2, 117
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

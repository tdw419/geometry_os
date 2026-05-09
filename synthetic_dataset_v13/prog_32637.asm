; DESCRIPTION: Places a green 89x114 rectangle at position (302, 6).
; PLAN: r0=302(x), r1=6(y), r2=89(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 6
LDI r2, 89
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

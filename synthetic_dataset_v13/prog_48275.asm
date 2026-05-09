; DESCRIPTION: Places a yellow 17x89 rectangle at position (156, 85).
; PLAN: r0=156(x), r1=85(y), r2=17(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 85
LDI r2, 17
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

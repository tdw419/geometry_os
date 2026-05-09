; DESCRIPTION: Places a yellow 53x89 rectangle at position (318, 163).
; PLAN: r0=318(x), r1=163(y), r2=53(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 163
LDI r2, 53
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

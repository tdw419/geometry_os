; DESCRIPTION: Places a yellow 78x114 rectangle at position (318, 79).
; PLAN: r0=318(x), r1=79(y), r2=78(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 79
LDI r2, 78
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

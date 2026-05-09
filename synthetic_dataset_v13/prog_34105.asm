; DESCRIPTION: Places a yellow 13x78 rectangle at position (66, 131).
; PLAN: r0=66(x), r1=131(y), r2=13(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 131
LDI r2, 13
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

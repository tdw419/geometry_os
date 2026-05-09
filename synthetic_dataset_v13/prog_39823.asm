; DESCRIPTION: Places a yellow 114x83 rectangle at position (134, 159).
; PLAN: r0=134(x), r1=159(y), r2=114(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 159
LDI r2, 114
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

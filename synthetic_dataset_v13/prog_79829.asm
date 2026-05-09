; DESCRIPTION: Places a yellow 93x114 rectangle at position (62, 94).
; PLAN: r0=62(x), r1=94(y), r2=93(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 94
LDI r2, 93
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

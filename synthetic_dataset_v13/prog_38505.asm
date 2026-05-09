; DESCRIPTION: Places a yellow 118x93 rectangle at position (310, 66).
; PLAN: r0=310(x), r1=66(y), r2=118(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 66
LDI r2, 118
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

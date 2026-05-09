; DESCRIPTION: Places a yellow 10x114 rectangle at position (426, 81).
; PLAN: r0=426(x), r1=81(y), r2=10(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 81
LDI r2, 10
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

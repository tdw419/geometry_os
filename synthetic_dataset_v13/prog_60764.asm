; DESCRIPTION: Places a yellow 10x93 rectangle at position (117, 101).
; PLAN: r0=117(x), r1=101(y), r2=10(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 101
LDI r2, 10
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

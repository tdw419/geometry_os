; DESCRIPTION: Places a green 115x118 rectangle at position (397, 131).
; PLAN: r0=397(x), r1=131(y), r2=115(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 131
LDI r2, 115
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

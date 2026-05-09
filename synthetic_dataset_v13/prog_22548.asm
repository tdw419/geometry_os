; DESCRIPTION: Places a green 115x118 rectangle at position (247, 116).
; PLAN: r0=247(x), r1=116(y), r2=115(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 116
LDI r2, 115
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

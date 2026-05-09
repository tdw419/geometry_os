; DESCRIPTION: Creates a green rectangular region at (257, 118) spanning 115 by 68 pixels.
; PLAN: r0=257(x), r1=118(y), r2=115(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 118
LDI r2, 115
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

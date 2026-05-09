; DESCRIPTION: Places a green 15x12 rectangle at position (343, 230).
; PLAN: r0=343(x), r1=230(y), r2=15(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 230
LDI r2, 15
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

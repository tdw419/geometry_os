; DESCRIPTION: Draws a green rectangle at (257, 191) with width 37 and height 49.
; PLAN: r0=257(x), r1=191(y), r2=37(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 191
LDI r2, 37
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

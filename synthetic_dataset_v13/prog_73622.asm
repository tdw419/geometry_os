; DESCRIPTION: Draws a yellow rectangle at (257, 65) with width 14 and height 23.
; PLAN: r0=257(x), r1=65(y), r2=14(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 65
LDI r2, 14
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a black rectangle at (257, 64) with width 48 and height 97.
; PLAN: r0=257(x), r1=64(y), r2=48(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 64
LDI r2, 48
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

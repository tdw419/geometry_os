; DESCRIPTION: Draws a black rectangle at (257, 51) with width 21 and height 30.
; PLAN: r0=257(x), r1=51(y), r2=21(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 51
LDI r2, 21
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

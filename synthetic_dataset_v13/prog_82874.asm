; DESCRIPTION: Draws a white rectangle at (257, 2) with width 19 and height 30.
; PLAN: r0=257(x), r1=2(y), r2=19(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 2
LDI r2, 19
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

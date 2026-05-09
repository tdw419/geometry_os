; DESCRIPTION: Draws a orange rectangle at (257, 25) with width 61 and height 17.
; PLAN: r0=257(x), r1=25(y), r2=61(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 25
LDI r2, 61
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

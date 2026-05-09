; DESCRIPTION: Draws a orange rectangle at (257, 66) with width 81 and height 113.
; PLAN: r0=257(x), r1=66(y), r2=81(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 66
LDI r2, 81
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

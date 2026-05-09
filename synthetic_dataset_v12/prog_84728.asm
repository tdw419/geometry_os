; DESCRIPTION: Draws a orange rectangle at (257, 72) with width 62 and height 40.
; PLAN: r0=257(x), r1=72(y), r2=62(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 72
LDI r2, 62
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

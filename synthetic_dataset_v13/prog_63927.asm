; DESCRIPTION: Draws a orange rectangle at (257, 38) with width 53 and height 119.
; PLAN: r0=257(x), r1=38(y), r2=53(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 38
LDI r2, 53
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

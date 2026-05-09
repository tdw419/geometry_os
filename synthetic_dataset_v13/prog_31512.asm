; DESCRIPTION: Draws a orange rectangle at (257, 42) with width 111 and height 26.
; PLAN: r0=257(x), r1=42(y), r2=111(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 42
LDI r2, 111
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

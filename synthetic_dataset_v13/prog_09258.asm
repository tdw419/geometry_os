; DESCRIPTION: Draws a red rectangle at (257, 165) with width 57 and height 83.
; PLAN: r0=257(x), r1=165(y), r2=57(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 165
LDI r2, 57
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

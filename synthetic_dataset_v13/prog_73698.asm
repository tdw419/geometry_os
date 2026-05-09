; DESCRIPTION: Draws a red rectangle at (257, 101) with width 50 and height 46.
; PLAN: r0=257(x), r1=101(y), r2=50(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 101
LDI r2, 50
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

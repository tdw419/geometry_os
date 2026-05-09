; DESCRIPTION: Draws a red rectangle at (257, 89) with width 41 and height 111.
; PLAN: r0=257(x), r1=89(y), r2=41(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 89
LDI r2, 41
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

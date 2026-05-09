; DESCRIPTION: Draws a black rectangle at (257, 93) with width 29 and height 46.
; PLAN: r0=257(x), r1=93(y), r2=29(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 93
LDI r2, 29
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

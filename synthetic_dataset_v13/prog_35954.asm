; DESCRIPTION: Draws a red rectangle at (257, 79) with width 78 and height 70.
; PLAN: r0=257(x), r1=79(y), r2=78(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 79
LDI r2, 78
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

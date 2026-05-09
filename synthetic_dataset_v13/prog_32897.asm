; DESCRIPTION: Draws a red rectangle at (35, 52) with width 63 and height 35.
; PLAN: r0=35(x), r1=52(y), r2=63(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 52
LDI r2, 63
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

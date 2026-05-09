; DESCRIPTION: Draws a red rectangle at (347, 165) with width 98 and height 63.
; PLAN: r0=347(x), r1=165(y), r2=98(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 165
LDI r2, 98
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

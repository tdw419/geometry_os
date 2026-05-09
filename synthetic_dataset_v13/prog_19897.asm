; DESCRIPTION: Draws a magenta rectangle at (332, 58) with width 25 and height 83.
; PLAN: r0=332(x), r1=58(y), r2=25(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 58
LDI r2, 25
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta rectangle at (248, 4) with width 14 and height 37.
; PLAN: r0=248(x), r1=4(y), r2=14(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 4
LDI r2, 14
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

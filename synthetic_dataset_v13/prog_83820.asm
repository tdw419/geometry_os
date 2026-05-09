; DESCRIPTION: Draws a magenta rectangle at (309, 220) with width 46 and height 13.
; PLAN: r0=309(x), r1=220(y), r2=46(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 220
LDI r2, 46
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Draws a magenta rectangle at (117, 85) with width 46 and height 98.
; PLAN: r0=117(x), r1=85(y), r2=46(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 85
LDI r2, 46
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

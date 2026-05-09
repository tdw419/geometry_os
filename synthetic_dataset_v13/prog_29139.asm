; DESCRIPTION: Draws a magenta rectangle at (162, 161) with width 115 and height 85.
; PLAN: r0=162(x), r1=161(y), r2=115(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 161
LDI r2, 115
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

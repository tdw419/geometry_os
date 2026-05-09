; DESCRIPTION: Draws a magenta rectangle at (162, 168) with width 95 and height 13.
; PLAN: r0=162(x), r1=168(y), r2=95(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 168
LDI r2, 95
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

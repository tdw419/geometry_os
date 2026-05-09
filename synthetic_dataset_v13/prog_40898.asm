; DESCRIPTION: Draws a magenta rectangle at (243, 10) with width 95 and height 22.
; PLAN: r0=243(x), r1=10(y), r2=95(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 10
LDI r2, 95
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

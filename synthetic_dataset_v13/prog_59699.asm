; DESCRIPTION: Draws a magenta rectangle at (21, 20) with width 100 and height 91.
; PLAN: r0=21(x), r1=20(y), r2=100(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 20
LDI r2, 100
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

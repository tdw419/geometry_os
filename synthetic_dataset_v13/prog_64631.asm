; DESCRIPTION: Draws a magenta rectangle at (290, 35) with width 48 and height 56.
; PLAN: r0=290(x), r1=35(y), r2=48(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 35
LDI r2, 48
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

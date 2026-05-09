; DESCRIPTION: Draws a magenta rectangle at (290, 80) with width 11 and height 80.
; PLAN: r0=290(x), r1=80(y), r2=11(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 80
LDI r2, 11
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

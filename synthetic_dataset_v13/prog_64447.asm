; DESCRIPTION: Draws a magenta rectangle at (290, 127) with width 10 and height 58.
; PLAN: r0=290(x), r1=127(y), r2=10(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 127
LDI r2, 10
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

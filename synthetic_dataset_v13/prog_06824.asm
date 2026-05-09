; DESCRIPTION: Draws a magenta rectangle at (241, 91) with width 47 and height 92.
; PLAN: r0=241(x), r1=91(y), r2=47(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 91
LDI r2, 47
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

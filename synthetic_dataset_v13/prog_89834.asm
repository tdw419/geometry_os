; DESCRIPTION: Draws a magenta rectangle at (306, 174) with width 49 and height 48.
; PLAN: r0=306(x), r1=174(y), r2=49(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 174
LDI r2, 49
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

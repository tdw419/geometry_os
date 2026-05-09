; DESCRIPTION: Draws a magenta rectangle at (174, 2) with width 12 and height 109.
; PLAN: r0=174(x), r1=2(y), r2=12(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 2
LDI r2, 12
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

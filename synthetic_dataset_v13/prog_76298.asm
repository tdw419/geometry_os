; DESCRIPTION: Draws a magenta rectangle at (245, 138) with width 91 and height 60.
; PLAN: r0=245(x), r1=138(y), r2=91(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 138
LDI r2, 91
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

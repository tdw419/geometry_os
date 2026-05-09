; DESCRIPTION: Draws a magenta rectangle at (245, 21) with width 69 and height 47.
; PLAN: r0=245(x), r1=21(y), r2=69(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 21
LDI r2, 69
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

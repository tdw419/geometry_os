; DESCRIPTION: Draws a magenta rectangle at (245, 108) with width 116 and height 80.
; PLAN: r0=245(x), r1=108(y), r2=116(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 108
LDI r2, 116
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

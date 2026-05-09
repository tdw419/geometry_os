; DESCRIPTION: Draws a magenta rectangle at (108, 85) with width 40 and height 103.
; PLAN: r0=108(x), r1=85(y), r2=40(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 85
LDI r2, 40
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

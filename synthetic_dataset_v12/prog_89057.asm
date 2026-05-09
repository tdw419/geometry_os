; DESCRIPTION: Draws a magenta rectangle at (404, 38) with width 15 and height 97.
; PLAN: r0=404(x), r1=38(y), r2=15(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 38
LDI r2, 15
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

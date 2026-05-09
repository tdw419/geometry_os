; DESCRIPTION: Draws a magenta rectangle at (404, 83) with width 47 and height 48.
; PLAN: r0=404(x), r1=83(y), r2=47(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 83
LDI r2, 47
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

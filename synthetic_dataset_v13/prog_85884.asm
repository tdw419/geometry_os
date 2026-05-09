; DESCRIPTION: Draws a magenta rectangle at (404, 33) with width 91 and height 31.
; PLAN: r0=404(x), r1=33(y), r2=91(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 33
LDI r2, 91
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

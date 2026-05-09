; DESCRIPTION: Draws a magenta rectangle at (403, 33) with width 11 and height 113.
; PLAN: r0=403(x), r1=33(y), r2=11(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 33
LDI r2, 11
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

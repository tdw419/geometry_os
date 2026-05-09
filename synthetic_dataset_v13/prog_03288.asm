; DESCRIPTION: Draws a magenta rectangle at (240, 33) with width 11 and height 30.
; PLAN: r0=240(x), r1=33(y), r2=11(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 33
LDI r2, 11
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

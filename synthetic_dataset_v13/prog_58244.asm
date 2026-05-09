; DESCRIPTION: Draws a magenta rectangle at (338, 191) with width 33 and height 44.
; PLAN: r0=338(x), r1=191(y), r2=33(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 191
LDI r2, 33
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

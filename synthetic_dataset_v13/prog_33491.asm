; DESCRIPTION: Draws a magenta rectangle at (312, 60) with width 55 and height 45.
; PLAN: r0=312(x), r1=60(y), r2=55(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 60
LDI r2, 55
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

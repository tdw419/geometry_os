; DESCRIPTION: Draws a magenta rectangle at (385, 68) with width 45 and height 39.
; PLAN: r0=385(x), r1=68(y), r2=45(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 68
LDI r2, 45
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

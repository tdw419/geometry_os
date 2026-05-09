; DESCRIPTION: Draws a magenta rectangle at (419, 47) with width 47 and height 90.
; PLAN: r0=419(x), r1=47(y), r2=47(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 47
LDI r2, 47
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

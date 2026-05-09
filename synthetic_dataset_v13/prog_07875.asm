; DESCRIPTION: Draws a magenta rectangle at (420, 146) with width 65 and height 45.
; PLAN: r0=420(x), r1=146(y), r2=65(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 146
LDI r2, 65
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

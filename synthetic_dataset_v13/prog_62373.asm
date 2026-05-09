; DESCRIPTION: Draws a magenta rectangle at (437, 78) with width 65 and height 68.
; PLAN: r0=437(x), r1=78(y), r2=65(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 78
LDI r2, 65
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

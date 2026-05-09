; DESCRIPTION: Draws a magenta rectangle at (85, 47) with width 27 and height 70.
; PLAN: r0=85(x), r1=47(y), r2=27(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 47
LDI r2, 27
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

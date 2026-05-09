; DESCRIPTION: Draws a magenta rectangle at (61, 47) with width 56 and height 85.
; PLAN: r0=61(x), r1=47(y), r2=56(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 47
LDI r2, 56
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

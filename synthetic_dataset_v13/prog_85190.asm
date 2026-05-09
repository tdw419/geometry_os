; DESCRIPTION: Creates a magenta rectangular region at (1, 90) spanning 65 by 74 pixels.
; PLAN: r0=1(x), r1=90(y), r2=65(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 90
LDI r2, 65
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

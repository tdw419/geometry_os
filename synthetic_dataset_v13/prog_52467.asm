; DESCRIPTION: Creates a magenta rectangular region at (303, 76) spanning 75 by 74 pixels.
; PLAN: r0=303(x), r1=76(y), r2=75(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 76
LDI r2, 75
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

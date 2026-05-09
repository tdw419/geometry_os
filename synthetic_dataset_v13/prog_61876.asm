; DESCRIPTION: Creates a magenta rectangular region at (249, 158) spanning 20 by 54 pixels.
; PLAN: r0=249(x), r1=158(y), r2=20(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 158
LDI r2, 20
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

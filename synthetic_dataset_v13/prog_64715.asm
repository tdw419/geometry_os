; DESCRIPTION: Creates a magenta rectangular region at (20, 87) spanning 118 by 70 pixels.
; PLAN: r0=20(x), r1=87(y), r2=118(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 87
LDI r2, 118
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

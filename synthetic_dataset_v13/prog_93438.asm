; DESCRIPTION: Creates a magenta rectangular region at (251, 16) spanning 100 by 88 pixels.
; PLAN: r0=251(x), r1=16(y), r2=100(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 16
LDI r2, 100
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

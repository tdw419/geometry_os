; DESCRIPTION: Creates a magenta rectangular region at (217, 52) spanning 80 by 119 pixels.
; PLAN: r0=217(x), r1=52(y), r2=80(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 52
LDI r2, 80
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

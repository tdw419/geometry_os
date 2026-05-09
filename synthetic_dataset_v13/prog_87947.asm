; DESCRIPTION: Creates a magenta rectangular region at (28, 3) spanning 79 by 119 pixels.
; PLAN: r0=28(x), r1=3(y), r2=79(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 3
LDI r2, 79
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

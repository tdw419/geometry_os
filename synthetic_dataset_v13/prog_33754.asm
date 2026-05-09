; DESCRIPTION: Creates a magenta rectangular region at (188, 106) spanning 13 by 80 pixels.
; PLAN: r0=188(x), r1=106(y), r2=13(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 106
LDI r2, 13
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

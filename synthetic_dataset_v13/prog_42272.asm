; DESCRIPTION: Creates a magenta rectangular region at (106, 40) spanning 84 by 110 pixels.
; PLAN: r0=106(x), r1=40(y), r2=84(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 40
LDI r2, 84
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

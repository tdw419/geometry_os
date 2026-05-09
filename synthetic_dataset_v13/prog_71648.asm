; DESCRIPTION: Creates a magenta rectangular region at (44, 1) spanning 106 by 55 pixels.
; PLAN: r0=44(x), r1=1(y), r2=106(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 1
LDI r2, 106
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

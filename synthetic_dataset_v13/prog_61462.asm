; DESCRIPTION: Creates a magenta rectangular region at (44, 88) spanning 104 by 99 pixels.
; PLAN: r0=44(x), r1=88(y), r2=104(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 88
LDI r2, 104
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

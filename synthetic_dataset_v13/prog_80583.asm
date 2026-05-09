; DESCRIPTION: Creates a magenta rectangular region at (249, 97) spanning 104 by 22 pixels.
; PLAN: r0=249(x), r1=97(y), r2=104(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 97
LDI r2, 104
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

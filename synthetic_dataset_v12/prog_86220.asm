; DESCRIPTION: Creates a magenta rectangular region at (260, 124) spanning 75 by 97 pixels.
; PLAN: r0=260(x), r1=124(y), r2=75(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 124
LDI r2, 75
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

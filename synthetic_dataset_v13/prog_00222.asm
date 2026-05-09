; DESCRIPTION: Creates a magenta rectangular region at (409, 112) spanning 97 by 13 pixels.
; PLAN: r0=409(x), r1=112(y), r2=97(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 112
LDI r2, 97
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

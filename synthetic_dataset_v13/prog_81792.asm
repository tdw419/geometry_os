; DESCRIPTION: Creates a magenta rectangular region at (413, 54) spanning 91 by 97 pixels.
; PLAN: r0=413(x), r1=54(y), r2=91(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 54
LDI r2, 91
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

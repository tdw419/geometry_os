; DESCRIPTION: Creates a magenta rectangular region at (339, 46) spanning 40 by 97 pixels.
; PLAN: r0=339(x), r1=46(y), r2=40(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 46
LDI r2, 40
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

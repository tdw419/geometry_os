; DESCRIPTION: Creates a magenta rectangular region at (340, 170) spanning 97 by 10 pixels.
; PLAN: r0=340(x), r1=170(y), r2=97(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 170
LDI r2, 97
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

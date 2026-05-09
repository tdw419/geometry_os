; DESCRIPTION: Creates a magenta rectangular region at (279, 78) spanning 97 by 50 pixels.
; PLAN: r0=279(x), r1=78(y), r2=97(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 78
LDI r2, 97
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (56, 150) spanning 78 by 36 pixels.
; PLAN: r0=56(x), r1=150(y), r2=78(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 150
LDI r2, 78
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

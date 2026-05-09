; DESCRIPTION: Creates a magenta rectangular region at (40, 144) spanning 90 by 78 pixels.
; PLAN: r0=40(x), r1=144(y), r2=90(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 144
LDI r2, 90
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (8, 127) spanning 78 by 91 pixels.
; PLAN: r0=8(x), r1=127(y), r2=78(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 127
LDI r2, 78
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

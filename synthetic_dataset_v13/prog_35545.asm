; DESCRIPTION: Creates a magenta rectangular region at (355, 144) spanning 108 by 86 pixels.
; PLAN: r0=355(x), r1=144(y), r2=108(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 144
LDI r2, 108
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

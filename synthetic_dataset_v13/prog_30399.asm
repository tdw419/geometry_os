; DESCRIPTION: Creates a magenta rectangular region at (318, 98) spanning 26 by 62 pixels.
; PLAN: r0=318(x), r1=98(y), r2=26(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 98
LDI r2, 26
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

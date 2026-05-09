; DESCRIPTION: Creates a magenta rectangular region at (15, 62) spanning 38 by 26 pixels.
; PLAN: r0=15(x), r1=62(y), r2=38(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 62
LDI r2, 38
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

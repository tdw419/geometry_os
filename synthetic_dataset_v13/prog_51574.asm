; DESCRIPTION: Creates a magenta rectangular region at (364, 132) spanning 102 by 69 pixels.
; PLAN: r0=364(x), r1=132(y), r2=102(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 132
LDI r2, 102
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

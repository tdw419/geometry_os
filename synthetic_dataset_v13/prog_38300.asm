; DESCRIPTION: Creates a magenta rectangular region at (274, 91) spanning 108 by 38 pixels.
; PLAN: r0=274(x), r1=91(y), r2=108(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 91
LDI r2, 108
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a magenta rectangular region at (129, 26) spanning 38 by 15 pixels.
; PLAN: r0=129(x), r1=26(y), r2=38(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 26
LDI r2, 38
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

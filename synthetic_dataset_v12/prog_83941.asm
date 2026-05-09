; DESCRIPTION: Creates a magenta rectangular region at (172, 198) spanning 34 by 26 pixels.
; PLAN: r0=172(x), r1=198(y), r2=34(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 198
LDI r2, 34
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

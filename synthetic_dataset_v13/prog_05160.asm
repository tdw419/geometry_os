; DESCRIPTION: Creates a magenta rectangular region at (34, 127) spanning 106 by 76 pixels.
; PLAN: r0=34(x), r1=127(y), r2=106(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 127
LDI r2, 106
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

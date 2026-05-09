; DESCRIPTION: Creates a magenta rectangular region at (13, 169) spanning 71 by 17 pixels.
; PLAN: r0=13(x), r1=169(y), r2=71(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 169
LDI r2, 71
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

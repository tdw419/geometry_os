; DESCRIPTION: Creates a magenta rectangular region at (253, 43) spanning 97 by 92 pixels.
; PLAN: r0=253(x), r1=43(y), r2=97(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 43
LDI r2, 97
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

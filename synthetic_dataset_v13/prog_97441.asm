; DESCRIPTION: Creates a magenta rectangular region at (351, 109) spanning 66 by 17 pixels.
; PLAN: r0=351(x), r1=109(y), r2=66(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 109
LDI r2, 66
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT

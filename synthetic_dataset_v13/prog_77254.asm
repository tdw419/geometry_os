; DESCRIPTION: Creates a yellow rectangular region at (378, 97) spanning 116 by 25 pixels.
; PLAN: r0=378(x), r1=97(y), r2=116(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 97
LDI r2, 116
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

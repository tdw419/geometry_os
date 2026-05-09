; DESCRIPTION: Creates a green rectangular region at (378, 113) spanning 101 by 118 pixels.
; PLAN: r0=378(x), r1=113(y), r2=101(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 113
LDI r2, 101
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

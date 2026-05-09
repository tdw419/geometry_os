; DESCRIPTION: Creates a black rectangular region at (147, 172) spanning 78 by 80 pixels.
; PLAN: r0=147(x), r1=172(y), r2=78(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 172
LDI r2, 78
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

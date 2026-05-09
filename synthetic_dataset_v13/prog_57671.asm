; DESCRIPTION: Creates a black rectangular region at (283, 183) spanning 110 by 17 pixels.
; PLAN: r0=283(x), r1=183(y), r2=110(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 183
LDI r2, 110
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

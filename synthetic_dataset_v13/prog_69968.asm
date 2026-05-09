; DESCRIPTION: Creates a yellow rectangular region at (253, 30) spanning 77 by 110 pixels.
; PLAN: r0=253(x), r1=30(y), r2=77(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 30
LDI r2, 77
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

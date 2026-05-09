; DESCRIPTION: Creates a yellow rectangular region at (347, 118) spanning 80 by 20 pixels.
; PLAN: r0=347(x), r1=118(y), r2=80(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 118
LDI r2, 80
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (282, 218) spanning 104 by 34 pixels.
; PLAN: r0=282(x), r1=218(y), r2=104(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 218
LDI r2, 104
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

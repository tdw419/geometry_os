; DESCRIPTION: Creates a green rectangular region at (411, 104) spanning 17 by 119 pixels.
; PLAN: r0=411(x), r1=104(y), r2=17(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 104
LDI r2, 17
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

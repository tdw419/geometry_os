; DESCRIPTION: Creates a green rectangular region at (347, 136) spanning 65 by 104 pixels.
; PLAN: r0=347(x), r1=136(y), r2=65(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 136
LDI r2, 65
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

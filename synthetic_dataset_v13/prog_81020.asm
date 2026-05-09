; DESCRIPTION: Creates a green rectangular region at (225, 78) spanning 71 by 104 pixels.
; PLAN: r0=225(x), r1=78(y), r2=71(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 78
LDI r2, 71
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (252, 136) spanning 110 by 17 pixels.
; PLAN: r0=252(x), r1=136(y), r2=110(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 136
LDI r2, 110
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

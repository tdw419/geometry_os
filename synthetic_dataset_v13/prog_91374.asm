; DESCRIPTION: Creates a white rectangular region at (136, 108) spanning 110 by 83 pixels.
; PLAN: r0=136(x), r1=108(y), r2=110(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 108
LDI r2, 110
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (492, 83) spanning 13 by 119 pixels.
; PLAN: r0=492(x), r1=83(y), r2=13(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 83
LDI r2, 13
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

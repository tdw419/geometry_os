; DESCRIPTION: Creates a green rectangular region at (385, 83) spanning 31 by 46 pixels.
; PLAN: r0=385(x), r1=83(y), r2=31(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 83
LDI r2, 31
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

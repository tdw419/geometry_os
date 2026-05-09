; DESCRIPTION: Creates a green rectangular region at (66, 83) spanning 84 by 46 pixels.
; PLAN: r0=66(x), r1=83(y), r2=84(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 83
LDI r2, 84
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (17, 84) spanning 21 by 13 pixels.
; PLAN: r0=17(x), r1=84(y), r2=21(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 84
LDI r2, 21
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

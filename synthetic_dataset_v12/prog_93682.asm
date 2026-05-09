; DESCRIPTION: Creates a green rectangular region at (17, 2) spanning 108 by 34 pixels.
; PLAN: r0=17(x), r1=2(y), r2=108(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 2
LDI r2, 108
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

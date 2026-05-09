; DESCRIPTION: Creates a green rectangular region at (343, 17) spanning 108 by 46 pixels.
; PLAN: r0=343(x), r1=17(y), r2=108(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 17
LDI r2, 108
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

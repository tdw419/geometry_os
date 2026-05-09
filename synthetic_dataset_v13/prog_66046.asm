; DESCRIPTION: Creates a green rectangular region at (363, 232) spanning 108 by 17 pixels.
; PLAN: r0=363(x), r1=232(y), r2=108(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 232
LDI r2, 108
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

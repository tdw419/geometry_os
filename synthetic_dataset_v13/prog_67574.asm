; DESCRIPTION: Creates a green rectangular region at (412, 108) spanning 38 by 119 pixels.
; PLAN: r0=412(x), r1=108(y), r2=38(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 108
LDI r2, 38
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

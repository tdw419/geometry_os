; DESCRIPTION: Creates a green rectangular region at (274, 72) spanning 31 by 108 pixels.
; PLAN: r0=274(x), r1=72(y), r2=31(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 72
LDI r2, 31
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (163, 108) spanning 21 by 87 pixels.
; PLAN: r0=163(x), r1=108(y), r2=21(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 108
LDI r2, 21
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

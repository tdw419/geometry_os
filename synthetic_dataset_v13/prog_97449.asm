; DESCRIPTION: Creates a yellow rectangular region at (47, 84) spanning 57 by 108 pixels.
; PLAN: r0=47(x), r1=84(y), r2=57(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 84
LDI r2, 57
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

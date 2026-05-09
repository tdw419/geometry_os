; DESCRIPTION: Creates a yellow rectangular region at (405, 135) spanning 84 by 108 pixels.
; PLAN: r0=405(x), r1=135(y), r2=84(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 135
LDI r2, 84
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

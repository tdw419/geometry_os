; DESCRIPTION: Creates a yellow rectangular region at (110, 102) spanning 21 by 59 pixels.
; PLAN: r0=110(x), r1=102(y), r2=21(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 102
LDI r2, 21
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

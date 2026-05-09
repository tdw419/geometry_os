; DESCRIPTION: Creates a yellow rectangular region at (251, 23) spanning 119 by 59 pixels.
; PLAN: r0=251(x), r1=23(y), r2=119(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 23
LDI r2, 119
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

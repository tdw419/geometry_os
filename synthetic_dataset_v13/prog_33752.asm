; DESCRIPTION: Creates a yellow rectangular region at (222, 33) spanning 34 by 23 pixels.
; PLAN: r0=222(x), r1=33(y), r2=34(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 33
LDI r2, 34
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

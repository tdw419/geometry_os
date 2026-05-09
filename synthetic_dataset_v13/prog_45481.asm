; DESCRIPTION: Creates a yellow rectangular region at (399, 108) spanning 89 by 62 pixels.
; PLAN: r0=399(x), r1=108(y), r2=89(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 108
LDI r2, 89
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

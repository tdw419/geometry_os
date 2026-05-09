; DESCRIPTION: Creates a white rectangular region at (451, 62) spanning 22 by 54 pixels.
; PLAN: r0=451(x), r1=62(y), r2=22(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 62
LDI r2, 22
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

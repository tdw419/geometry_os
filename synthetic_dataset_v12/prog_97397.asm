; DESCRIPTION: Creates a yellow rectangular region at (122, 54) spanning 38 by 31 pixels.
; PLAN: r0=122(x), r1=54(y), r2=38(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 54
LDI r2, 38
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

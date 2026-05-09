; DESCRIPTION: Creates a yellow rectangular region at (47, 62) spanning 60 by 52 pixels.
; PLAN: r0=47(x), r1=62(y), r2=60(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 62
LDI r2, 60
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

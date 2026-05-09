; DESCRIPTION: Creates a yellow rectangular region at (335, 52) spanning 77 by 35 pixels.
; PLAN: r0=335(x), r1=52(y), r2=77(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 52
LDI r2, 77
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

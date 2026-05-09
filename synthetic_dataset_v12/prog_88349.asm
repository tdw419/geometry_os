; DESCRIPTION: Creates a yellow rectangular region at (355, 85) spanning 47 by 31 pixels.
; PLAN: r0=355(x), r1=85(y), r2=47(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 85
LDI r2, 47
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

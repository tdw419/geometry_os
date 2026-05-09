; DESCRIPTION: Creates a yellow rectangular region at (335, 178) spanning 83 by 11 pixels.
; PLAN: r0=335(x), r1=178(y), r2=83(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 178
LDI r2, 83
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

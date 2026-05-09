; DESCRIPTION: Creates a yellow rectangular region at (355, 172) spanning 74 by 17 pixels.
; PLAN: r0=355(x), r1=172(y), r2=74(width), r3=17(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 172
LDI r2, 74
LDI r3, 17
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

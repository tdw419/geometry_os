; DESCRIPTION: Creates a yellow rectangular region at (9, 94) spanning 18 by 119 pixels.
; PLAN: r0=9(x), r1=94(y), r2=18(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 94
LDI r2, 18
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

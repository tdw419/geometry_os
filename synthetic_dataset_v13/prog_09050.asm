; DESCRIPTION: Creates a yellow rectangular region at (438, 25) spanning 29 by 78 pixels.
; PLAN: r0=438(x), r1=25(y), r2=29(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 25
LDI r2, 29
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

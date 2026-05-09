; DESCRIPTION: Creates a yellow rectangular region at (65, 169) spanning 46 by 78 pixels.
; PLAN: r0=65(x), r1=169(y), r2=46(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 169
LDI r2, 46
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

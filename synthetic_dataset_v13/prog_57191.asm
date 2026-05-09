; DESCRIPTION: Creates a yellow rectangular region at (116, 44) spanning 20 by 119 pixels.
; PLAN: r0=116(x), r1=44(y), r2=20(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 44
LDI r2, 20
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

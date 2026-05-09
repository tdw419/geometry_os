; DESCRIPTION: Creates a green rectangular region at (34, 83) spanning 116 by 44 pixels.
; PLAN: r0=34(x), r1=83(y), r2=116(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 83
LDI r2, 116
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

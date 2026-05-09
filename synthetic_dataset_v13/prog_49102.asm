; DESCRIPTION: Creates a yellow rectangular region at (416, 119) spanning 89 by 86 pixels.
; PLAN: r0=416(x), r1=119(y), r2=89(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 119
LDI r2, 89
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

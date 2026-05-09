; DESCRIPTION: Creates a yellow rectangular region at (72, 119) spanning 49 by 80 pixels.
; PLAN: r0=72(x), r1=119(y), r2=49(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 119
LDI r2, 49
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

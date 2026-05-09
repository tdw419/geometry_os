; DESCRIPTION: Creates a yellow rectangular region at (12, 119) spanning 90 by 33 pixels.
; PLAN: r0=12(x), r1=119(y), r2=90(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 119
LDI r2, 90
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

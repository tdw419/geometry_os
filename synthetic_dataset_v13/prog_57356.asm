; DESCRIPTION: Creates a yellow rectangular region at (192, 90) spanning 20 by 100 pixels.
; PLAN: r0=192(x), r1=90(y), r2=20(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 90
LDI r2, 20
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

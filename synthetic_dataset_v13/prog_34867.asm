; DESCRIPTION: Creates a yellow rectangular region at (183, 3) spanning 38 by 110 pixels.
; PLAN: r0=183(x), r1=3(y), r2=38(width), r3=110(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 3
LDI r2, 38
LDI r3, 110
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (222, 20) spanning 110 by 106 pixels.
; PLAN: r0=222(x), r1=20(y), r2=110(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 20
LDI r2, 110
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

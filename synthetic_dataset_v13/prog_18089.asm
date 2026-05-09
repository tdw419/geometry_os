; DESCRIPTION: Creates a white rectangular region at (248, 110) spanning 55 by 100 pixels.
; PLAN: r0=248(x), r1=110(y), r2=55(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 110
LDI r2, 55
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

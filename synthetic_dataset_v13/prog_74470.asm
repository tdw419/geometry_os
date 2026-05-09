; DESCRIPTION: Creates a yellow rectangular region at (394, 70) spanning 110 by 49 pixels.
; PLAN: r0=394(x), r1=70(y), r2=110(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 70
LDI r2, 110
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

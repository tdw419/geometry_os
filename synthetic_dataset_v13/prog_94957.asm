; DESCRIPTION: Creates a purple rectangular region at (174, 110) spanning 38 by 110 pixels.
; PLAN: r0=174(x), r1=110(y), r2=38(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 110
LDI r2, 38
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

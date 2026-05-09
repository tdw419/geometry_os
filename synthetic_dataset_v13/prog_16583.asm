; DESCRIPTION: Creates a white rectangular region at (344, 65) spanning 49 by 55 pixels.
; PLAN: r0=344(x), r1=65(y), r2=49(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 65
LDI r2, 49
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

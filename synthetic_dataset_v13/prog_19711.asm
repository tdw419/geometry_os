; DESCRIPTION: Creates a white rectangular region at (390, 87) spanning 38 by 12 pixels.
; PLAN: r0=390(x), r1=87(y), r2=38(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 87
LDI r2, 38
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

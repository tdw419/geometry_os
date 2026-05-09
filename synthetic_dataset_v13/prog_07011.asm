; DESCRIPTION: Creates a white rectangular region at (248, 80) spanning 83 by 20 pixels.
; PLAN: r0=248(x), r1=80(y), r2=83(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 80
LDI r2, 83
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

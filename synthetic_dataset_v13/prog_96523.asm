; DESCRIPTION: Creates a black rectangular region at (77, 82) spanning 75 by 110 pixels.
; PLAN: r0=77(x), r1=82(y), r2=75(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 82
LDI r2, 75
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

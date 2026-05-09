; DESCRIPTION: Creates a white rectangular region at (388, 17) spanning 84 by 115 pixels.
; PLAN: r0=388(x), r1=17(y), r2=84(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 17
LDI r2, 84
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (217, 115) spanning 31 by 29 pixels.
; PLAN: r0=217(x), r1=115(y), r2=31(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 115
LDI r2, 31
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

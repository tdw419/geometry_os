; DESCRIPTION: Creates a white rectangular region at (12, 119) spanning 112 by 110 pixels.
; PLAN: r0=12(x), r1=119(y), r2=112(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 119
LDI r2, 112
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

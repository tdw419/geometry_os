; DESCRIPTION: Creates a white rectangular region at (49, 80) spanning 72 by 106 pixels.
; PLAN: r0=49(x), r1=80(y), r2=72(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 80
LDI r2, 72
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

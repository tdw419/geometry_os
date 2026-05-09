; DESCRIPTION: Creates a white rectangular region at (342, 115) spanning 102 by 24 pixels.
; PLAN: r0=342(x), r1=115(y), r2=102(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 115
LDI r2, 102
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (379, 74) spanning 37 by 35 pixels.
; PLAN: r0=379(x), r1=74(y), r2=37(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 74
LDI r2, 37
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

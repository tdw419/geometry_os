; DESCRIPTION: Creates a white rectangular region at (376, 158) spanning 55 by 66 pixels.
; PLAN: r0=376(x), r1=158(y), r2=55(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 158
LDI r2, 55
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

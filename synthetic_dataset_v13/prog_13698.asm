; DESCRIPTION: Creates a white rectangular region at (376, 53) spanning 91 by 110 pixels.
; PLAN: r0=376(x), r1=53(y), r2=91(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 53
LDI r2, 91
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

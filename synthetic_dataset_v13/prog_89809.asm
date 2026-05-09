; DESCRIPTION: Creates a white rectangular region at (58, 170) spanning 30 by 80 pixels.
; PLAN: r0=58(x), r1=170(y), r2=30(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 170
LDI r2, 30
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

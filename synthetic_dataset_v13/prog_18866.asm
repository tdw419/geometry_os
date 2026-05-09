; DESCRIPTION: Creates a white rectangular region at (37, 2) spanning 12 by 38 pixels.
; PLAN: r0=37(x), r1=2(y), r2=12(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 2
LDI r2, 12
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

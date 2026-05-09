; DESCRIPTION: Creates a white rectangular region at (102, 30) spanning 20 by 75 pixels.
; PLAN: r0=102(x), r1=30(y), r2=20(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 30
LDI r2, 20
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

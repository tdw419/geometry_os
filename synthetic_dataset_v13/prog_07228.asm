; DESCRIPTION: Creates a white rectangular region at (208, 92) spanning 110 by 78 pixels.
; PLAN: r0=208(x), r1=92(y), r2=110(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 92
LDI r2, 110
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

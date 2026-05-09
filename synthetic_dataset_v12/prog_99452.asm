; DESCRIPTION: Creates a white rectangular region at (335, 21) spanning 118 by 80 pixels.
; PLAN: r0=335(x), r1=21(y), r2=118(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 21
LDI r2, 118
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

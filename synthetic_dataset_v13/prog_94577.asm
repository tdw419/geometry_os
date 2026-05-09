; DESCRIPTION: Creates a white rectangular region at (395, 75) spanning 60 by 96 pixels.
; PLAN: r0=395(x), r1=75(y), r2=60(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 75
LDI r2, 60
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

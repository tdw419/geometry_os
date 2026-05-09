; DESCRIPTION: Composite: Creates a white rectangular region at (416, 77) spanning 49 by 16 pixels then Sets a single yellow pixel at (202, 61).
; PLAN: r0=416(x), r1=77(y), r2=49(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x), r6=61(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 77
LDI r2, 49
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 61
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT

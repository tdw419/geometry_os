; DESCRIPTION: Creates a white rectangular region at (391, 183) spanning 73 by 38 pixels.
; PLAN: r0=391(x), r1=183(y), r2=73(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 183
LDI r2, 73
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

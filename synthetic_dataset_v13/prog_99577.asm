; DESCRIPTION: Creates a white rectangular region at (391, 9) spanning 81 by 60 pixels.
; PLAN: r0=391(x), r1=9(y), r2=81(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 9
LDI r2, 81
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

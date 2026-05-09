; DESCRIPTION: Creates a white rectangular region at (47, 24) spanning 54 by 20 pixels.
; PLAN: r0=47(x), r1=24(y), r2=54(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 24
LDI r2, 54
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

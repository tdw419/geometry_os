; DESCRIPTION: Creates a white rectangular region at (233, 28) spanning 78 by 120 pixels.
; PLAN: r0=233(x), r1=28(y), r2=78(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 28
LDI r2, 78
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

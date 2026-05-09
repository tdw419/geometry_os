; DESCRIPTION: Creates a white rectangular region at (17, 124) spanning 49 by 77 pixels.
; PLAN: r0=17(x), r1=124(y), r2=49(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 124
LDI r2, 49
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

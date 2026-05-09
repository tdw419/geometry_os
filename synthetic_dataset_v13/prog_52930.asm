; DESCRIPTION: Creates a white rectangular region at (77, 35) spanning 49 by 91 pixels.
; PLAN: r0=77(x), r1=35(y), r2=49(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 35
LDI r2, 49
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

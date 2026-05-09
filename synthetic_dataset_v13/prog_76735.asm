; DESCRIPTION: Creates a white rectangular region at (71, 81) spanning 77 by 73 pixels.
; PLAN: r0=71(x), r1=81(y), r2=77(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 81
LDI r2, 77
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

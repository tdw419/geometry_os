; DESCRIPTION: Creates a white rectangular region at (111, 77) spanning 37 by 114 pixels.
; PLAN: r0=111(x), r1=77(y), r2=37(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 77
LDI r2, 37
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

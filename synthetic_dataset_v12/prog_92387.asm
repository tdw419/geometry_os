; DESCRIPTION: Creates a white rectangular region at (132, 77) spanning 106 by 19 pixels.
; PLAN: r0=132(x), r1=77(y), r2=106(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 77
LDI r2, 106
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

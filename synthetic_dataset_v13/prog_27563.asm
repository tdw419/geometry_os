; DESCRIPTION: Creates a white rectangular region at (106, 119) spanning 119 by 112 pixels.
; PLAN: r0=106(x), r1=119(y), r2=119(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 119
LDI r2, 119
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

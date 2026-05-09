; DESCRIPTION: Creates a white rectangular region at (52, 218) spanning 112 by 31 pixels.
; PLAN: r0=52(x), r1=218(y), r2=112(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 218
LDI r2, 112
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

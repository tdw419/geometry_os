; DESCRIPTION: Creates a white rectangular region at (373, 112) spanning 87 by 99 pixels.
; PLAN: r0=373(x), r1=112(y), r2=87(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 112
LDI r2, 87
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

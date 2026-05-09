; DESCRIPTION: Creates a white rectangular region at (283, 199) spanning 33 by 25 pixels.
; PLAN: r0=283(x), r1=199(y), r2=33(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 199
LDI r2, 33
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

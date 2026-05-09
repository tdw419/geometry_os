; DESCRIPTION: Creates a white rectangular region at (318, 188) spanning 66 by 44 pixels.
; PLAN: r0=318(x), r1=188(y), r2=66(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 188
LDI r2, 66
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

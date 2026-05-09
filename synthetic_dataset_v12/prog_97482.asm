; DESCRIPTION: Creates a white rectangular region at (188, 171) spanning 19 by 66 pixels.
; PLAN: r0=188(x), r1=171(y), r2=19(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 171
LDI r2, 19
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

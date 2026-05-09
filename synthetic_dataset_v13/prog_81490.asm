; DESCRIPTION: Creates a white rectangular region at (181, 123) spanning 39 by 80 pixels.
; PLAN: r0=181(x), r1=123(y), r2=39(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 123
LDI r2, 39
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

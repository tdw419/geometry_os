; DESCRIPTION: Creates a white rectangular region at (407, 46) spanning 22 by 56 pixels.
; PLAN: r0=407(x), r1=46(y), r2=22(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 46
LDI r2, 22
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

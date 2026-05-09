; DESCRIPTION: Creates a white rectangular region at (278, 11) spanning 99 by 56 pixels.
; PLAN: r0=278(x), r1=11(y), r2=99(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 11
LDI r2, 99
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

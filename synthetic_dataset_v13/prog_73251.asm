; DESCRIPTION: Creates a black rectangular region at (11, 102) spanning 17 by 75 pixels.
; PLAN: r0=11(x), r1=102(y), r2=17(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 102
LDI r2, 17
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

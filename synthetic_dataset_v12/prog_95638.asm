; DESCRIPTION: Creates a black rectangular region at (199, 40) spanning 17 by 72 pixels.
; PLAN: r0=199(x), r1=40(y), r2=17(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 40
LDI r2, 17
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

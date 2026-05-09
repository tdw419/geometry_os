; DESCRIPTION: Creates a black rectangular region at (399, 40) spanning 71 by 110 pixels.
; PLAN: r0=399(x), r1=40(y), r2=71(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 40
LDI r2, 71
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

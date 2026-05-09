; DESCRIPTION: Creates a black rectangular region at (105, 80) spanning 19 by 33 pixels.
; PLAN: r0=105(x), r1=80(y), r2=19(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 80
LDI r2, 19
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

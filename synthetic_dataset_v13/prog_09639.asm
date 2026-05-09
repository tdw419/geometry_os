; DESCRIPTION: Creates a black rectangular region at (10, 38) spanning 97 by 105 pixels.
; PLAN: r0=10(x), r1=38(y), r2=97(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 38
LDI r2, 97
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (9, 20) spanning 43 by 35 pixels.
; PLAN: r0=9(x), r1=20(y), r2=43(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 20
LDI r2, 43
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

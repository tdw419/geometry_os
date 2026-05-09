; DESCRIPTION: Creates a black rectangular region at (223, 96) spanning 19 by 97 pixels.
; PLAN: r0=223(x), r1=96(y), r2=19(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 96
LDI r2, 19
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

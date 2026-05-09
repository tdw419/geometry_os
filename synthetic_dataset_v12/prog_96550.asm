; DESCRIPTION: Creates a black rectangular region at (121, 11) spanning 13 by 18 pixels.
; PLAN: r0=121(x), r1=11(y), r2=13(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 11
LDI r2, 13
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (431, 115) spanning 33 by 13 pixels.
; PLAN: r0=431(x), r1=115(y), r2=33(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 115
LDI r2, 33
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

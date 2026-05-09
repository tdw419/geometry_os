; DESCRIPTION: Creates a black rectangular region at (34, 161) spanning 46 by 26 pixels.
; PLAN: r0=34(x), r1=161(y), r2=46(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 161
LDI r2, 46
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (130, 156) spanning 99 by 69 pixels.
; PLAN: r0=130(x), r1=156(y), r2=99(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 156
LDI r2, 99
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

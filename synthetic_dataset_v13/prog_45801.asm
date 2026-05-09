; DESCRIPTION: Creates a black rectangular region at (144, 156) spanning 33 by 26 pixels.
; PLAN: r0=144(x), r1=156(y), r2=33(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 156
LDI r2, 33
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

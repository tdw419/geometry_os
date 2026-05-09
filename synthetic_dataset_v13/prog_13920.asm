; DESCRIPTION: Creates a black rectangular region at (106, 91) spanning 78 by 84 pixels.
; PLAN: r0=106(x), r1=91(y), r2=78(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 91
LDI r2, 78
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

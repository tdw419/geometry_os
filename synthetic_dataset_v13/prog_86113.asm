; DESCRIPTION: Creates a black rectangular region at (194, 135) spanning 91 by 75 pixels.
; PLAN: r0=194(x), r1=135(y), r2=91(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 135
LDI r2, 91
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

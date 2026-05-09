; DESCRIPTION: Creates a black rectangular region at (321, 165) spanning 97 by 77 pixels.
; PLAN: r0=321(x), r1=165(y), r2=97(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 165
LDI r2, 97
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

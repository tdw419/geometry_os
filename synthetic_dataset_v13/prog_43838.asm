; DESCRIPTION: Creates a yellow rectangular region at (251, 106) spanning 46 by 105 pixels.
; PLAN: r0=251(x), r1=106(y), r2=46(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 106
LDI r2, 46
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

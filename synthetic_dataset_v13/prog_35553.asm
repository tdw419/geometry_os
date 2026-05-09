; DESCRIPTION: Creates a black rectangular region at (81, 174) spanning 105 by 44 pixels.
; PLAN: r0=81(x), r1=174(y), r2=105(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 174
LDI r2, 105
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

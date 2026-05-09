; DESCRIPTION: Creates a black rectangular region at (153, 45) spanning 106 by 44 pixels.
; PLAN: r0=153(x), r1=45(y), r2=106(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 45
LDI r2, 106
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

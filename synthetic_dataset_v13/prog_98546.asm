; DESCRIPTION: Creates a yellow rectangular region at (208, 115) spanning 44 by 43 pixels.
; PLAN: r0=208(x), r1=115(y), r2=44(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 115
LDI r2, 44
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

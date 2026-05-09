; DESCRIPTION: Creates a yellow rectangular region at (441, 114) spanning 33 by 74 pixels.
; PLAN: r0=441(x), r1=114(y), r2=33(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 114
LDI r2, 33
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

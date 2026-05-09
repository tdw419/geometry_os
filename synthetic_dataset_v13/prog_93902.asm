; DESCRIPTION: Creates a yellow rectangular region at (19, 199) spanning 117 by 53 pixels.
; PLAN: r0=19(x), r1=199(y), r2=117(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 199
LDI r2, 117
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

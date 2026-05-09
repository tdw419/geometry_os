; DESCRIPTION: Creates a yellow rectangular region at (114, 222) spanning 23 by 19 pixels.
; PLAN: r0=114(x), r1=222(y), r2=23(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 222
LDI r2, 23
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

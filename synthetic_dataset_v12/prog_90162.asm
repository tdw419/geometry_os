; DESCRIPTION: Creates a yellow rectangular region at (166, 49) spanning 19 by 112 pixels.
; PLAN: r0=166(x), r1=49(y), r2=19(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 49
LDI r2, 19
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (318, 73) spanning 112 by 69 pixels.
; PLAN: r0=318(x), r1=73(y), r2=112(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 73
LDI r2, 112
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

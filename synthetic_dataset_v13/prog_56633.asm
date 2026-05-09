; DESCRIPTION: Creates a yellow rectangular region at (52, 141) spanning 62 by 114 pixels.
; PLAN: r0=52(x), r1=141(y), r2=62(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 141
LDI r2, 62
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

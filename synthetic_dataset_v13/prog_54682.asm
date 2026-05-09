; DESCRIPTION: Creates a yellow rectangular region at (461, 114) spanning 43 by 36 pixels.
; PLAN: r0=461(x), r1=114(y), r2=43(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 114
LDI r2, 43
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

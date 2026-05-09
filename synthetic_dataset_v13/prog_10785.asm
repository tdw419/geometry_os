; DESCRIPTION: Creates a yellow rectangular region at (182, 148) spanning 75 by 43 pixels.
; PLAN: r0=182(x), r1=148(y), r2=75(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 148
LDI r2, 75
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

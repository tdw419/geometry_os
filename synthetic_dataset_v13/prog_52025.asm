; DESCRIPTION: Creates a yellow rectangular region at (118, 19) spanning 33 by 69 pixels.
; PLAN: r0=118(x), r1=19(y), r2=33(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 19
LDI r2, 33
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

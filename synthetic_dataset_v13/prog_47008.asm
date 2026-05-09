; DESCRIPTION: Creates a yellow rectangular region at (69, 88) spanning 75 by 102 pixels.
; PLAN: r0=69(x), r1=88(y), r2=75(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 88
LDI r2, 75
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

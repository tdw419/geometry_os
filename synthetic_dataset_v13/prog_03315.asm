; DESCRIPTION: Creates a yellow rectangular region at (10, 36) spanning 88 by 69 pixels.
; PLAN: r0=10(x), r1=36(y), r2=88(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 36
LDI r2, 88
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

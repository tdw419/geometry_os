; DESCRIPTION: Creates a yellow rectangular region at (245, 69) spanning 55 by 72 pixels.
; PLAN: r0=245(x), r1=69(y), r2=55(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 69
LDI r2, 55
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

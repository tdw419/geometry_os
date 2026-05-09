; DESCRIPTION: Creates a yellow rectangular region at (283, 69) spanning 30 by 56 pixels.
; PLAN: r0=283(x), r1=69(y), r2=30(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 69
LDI r2, 30
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

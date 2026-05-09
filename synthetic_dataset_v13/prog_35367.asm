; DESCRIPTION: Creates a yellow rectangular region at (69, 185) spanning 22 by 24 pixels.
; PLAN: r0=69(x), r1=185(y), r2=22(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 185
LDI r2, 22
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

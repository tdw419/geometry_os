; DESCRIPTION: Creates a yellow rectangular region at (249, 117) spanning 101 by 69 pixels.
; PLAN: r0=249(x), r1=117(y), r2=101(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 117
LDI r2, 101
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

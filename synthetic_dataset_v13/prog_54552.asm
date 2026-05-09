; DESCRIPTION: Creates a yellow rectangular region at (174, 76) spanning 69 by 49 pixels.
; PLAN: r0=174(x), r1=76(y), r2=69(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 76
LDI r2, 69
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

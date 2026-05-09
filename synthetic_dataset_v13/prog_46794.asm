; DESCRIPTION: Creates a yellow rectangular region at (440, 153) spanning 58 by 69 pixels.
; PLAN: r0=440(x), r1=153(y), r2=58(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 153
LDI r2, 58
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

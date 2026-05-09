; DESCRIPTION: Creates a yellow rectangular region at (33, 153) spanning 51 by 35 pixels.
; PLAN: r0=33(x), r1=153(y), r2=51(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 153
LDI r2, 51
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

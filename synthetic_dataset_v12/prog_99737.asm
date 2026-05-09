; DESCRIPTION: Creates a yellow rectangular region at (74, 153) spanning 33 by 53 pixels.
; PLAN: r0=74(x), r1=153(y), r2=33(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 153
LDI r2, 33
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

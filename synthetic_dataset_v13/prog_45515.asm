; DESCRIPTION: Creates a yellow rectangular region at (292, 135) spanning 118 by 55 pixels.
; PLAN: r0=292(x), r1=135(y), r2=118(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 135
LDI r2, 118
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

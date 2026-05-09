; DESCRIPTION: Creates a yellow rectangular region at (369, 123) spanning 47 by 81 pixels.
; PLAN: r0=369(x), r1=123(y), r2=47(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 123
LDI r2, 47
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

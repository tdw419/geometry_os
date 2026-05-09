; DESCRIPTION: Creates a green rectangular region at (369, 101) spanning 80 by 12 pixels.
; PLAN: r0=369(x), r1=101(y), r2=80(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 101
LDI r2, 80
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

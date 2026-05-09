; DESCRIPTION: Creates a green rectangular region at (369, 8) spanning 78 by 33 pixels.
; PLAN: r0=369(x), r1=8(y), r2=78(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 8
LDI r2, 78
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

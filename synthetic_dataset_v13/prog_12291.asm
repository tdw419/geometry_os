; DESCRIPTION: Creates a blue rectangular region at (369, 186) spanning 102 by 60 pixels.
; PLAN: r0=369(x), r1=186(y), r2=102(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 186
LDI r2, 102
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

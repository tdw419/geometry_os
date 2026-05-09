; DESCRIPTION: Creates a yellow rectangular region at (119, 147) spanning 117 by 59 pixels.
; PLAN: r0=119(x), r1=147(y), r2=117(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 147
LDI r2, 117
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (160, 147) spanning 117 by 22 pixels.
; PLAN: r0=160(x), r1=147(y), r2=117(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 147
LDI r2, 117
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

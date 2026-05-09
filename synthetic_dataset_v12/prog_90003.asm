; DESCRIPTION: Creates a yellow rectangular region at (447, 147) spanning 22 by 65 pixels.
; PLAN: r0=447(x), r1=147(y), r2=22(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 147
LDI r2, 22
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

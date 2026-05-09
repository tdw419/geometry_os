; DESCRIPTION: Creates a yellow rectangular region at (71, 147) spanning 11 by 38 pixels.
; PLAN: r0=71(x), r1=147(y), r2=11(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 147
LDI r2, 11
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (198, 147) spanning 12 by 47 pixels.
; PLAN: r0=198(x), r1=147(y), r2=12(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 147
LDI r2, 12
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (357, 147) spanning 12 by 64 pixels.
; PLAN: r0=357(x), r1=147(y), r2=12(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 147
LDI r2, 12
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

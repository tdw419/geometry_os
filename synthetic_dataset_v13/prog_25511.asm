; DESCRIPTION: Creates a black rectangular region at (373, 147) spanning 69 by 79 pixels.
; PLAN: r0=373(x), r1=147(y), r2=69(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 147
LDI r2, 69
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

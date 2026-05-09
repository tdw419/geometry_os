; DESCRIPTION: Creates a purple rectangular region at (205, 147) spanning 17 by 107 pixels.
; PLAN: r0=205(x), r1=147(y), r2=17(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 147
LDI r2, 17
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

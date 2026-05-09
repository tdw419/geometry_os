; DESCRIPTION: Creates a purple rectangular region at (102, 147) spanning 35 by 65 pixels.
; PLAN: r0=102(x), r1=147(y), r2=35(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 147
LDI r2, 35
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a blue rectangular region at (115, 147) spanning 11 by 47 pixels.
; PLAN: r0=115(x), r1=147(y), r2=11(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 147
LDI r2, 11
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

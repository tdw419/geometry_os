; DESCRIPTION: Creates a blue rectangular region at (27, 147) spanning 95 by 102 pixels.
; PLAN: r0=27(x), r1=147(y), r2=95(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 147
LDI r2, 95
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

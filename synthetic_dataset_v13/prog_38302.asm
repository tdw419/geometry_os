; DESCRIPTION: Creates a green rectangular region at (210, 147) spanning 62 by 101 pixels.
; PLAN: r0=210(x), r1=147(y), r2=62(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 147
LDI r2, 62
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

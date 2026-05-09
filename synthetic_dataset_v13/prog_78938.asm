; DESCRIPTION: Creates a green rectangular region at (150, 147) spanning 110 by 53 pixels.
; PLAN: r0=150(x), r1=147(y), r2=110(width), r3=53(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 147
LDI r2, 110
LDI r3, 53
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

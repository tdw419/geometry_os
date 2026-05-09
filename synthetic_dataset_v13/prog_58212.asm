; DESCRIPTION: Creates a green rectangular region at (155, 107) spanning 35 by 63 pixels.
; PLAN: r0=155(x), r1=107(y), r2=35(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 107
LDI r2, 35
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

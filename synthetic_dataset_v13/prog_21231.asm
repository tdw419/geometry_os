; DESCRIPTION: Creates a yellow rectangular region at (362, 78) spanning 110 by 115 pixels.
; PLAN: r0=362(x), r1=78(y), r2=110(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 78
LDI r2, 110
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

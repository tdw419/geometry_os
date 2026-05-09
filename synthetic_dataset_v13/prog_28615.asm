; DESCRIPTION: Creates a green rectangular region at (469, 17) spanning 35 by 117 pixels.
; PLAN: r0=469(x), r1=17(y), r2=35(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 17
LDI r2, 35
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

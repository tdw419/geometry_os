; DESCRIPTION: Creates a green rectangular region at (432, 58) spanning 28 by 78 pixels.
; PLAN: r0=432(x), r1=58(y), r2=28(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 58
LDI r2, 28
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

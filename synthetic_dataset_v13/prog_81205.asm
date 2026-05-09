; DESCRIPTION: Creates a green rectangular region at (364, 91) spanning 49 by 38 pixels.
; PLAN: r0=364(x), r1=91(y), r2=49(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 91
LDI r2, 49
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

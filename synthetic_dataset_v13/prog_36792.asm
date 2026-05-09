; DESCRIPTION: Creates a green rectangular region at (407, 54) spanning 46 by 57 pixels.
; PLAN: r0=407(x), r1=54(y), r2=46(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 54
LDI r2, 46
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

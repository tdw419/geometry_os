; DESCRIPTION: Creates a green rectangular region at (129, 65) spanning 77 by 91 pixels.
; PLAN: r0=129(x), r1=65(y), r2=77(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 65
LDI r2, 77
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

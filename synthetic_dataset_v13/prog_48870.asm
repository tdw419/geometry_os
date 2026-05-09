; DESCRIPTION: Creates a green rectangular region at (251, 62) spanning 66 by 54 pixels.
; PLAN: r0=251(x), r1=62(y), r2=66(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 62
LDI r2, 66
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

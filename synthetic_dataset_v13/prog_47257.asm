; DESCRIPTION: Creates a green rectangular region at (462, 26) spanning 12 by 66 pixels.
; PLAN: r0=462(x), r1=26(y), r2=12(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 26
LDI r2, 12
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (130, 34) spanning 69 by 94 pixels.
; PLAN: r0=130(x), r1=34(y), r2=69(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 34
LDI r2, 69
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

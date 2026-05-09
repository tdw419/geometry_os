; DESCRIPTION: Creates a green rectangular region at (441, 66) spanning 69 by 38 pixels.
; PLAN: r0=441(x), r1=66(y), r2=69(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 66
LDI r2, 69
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

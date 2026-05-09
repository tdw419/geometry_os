; DESCRIPTION: Creates a green rectangular region at (76, 174) spanning 22 by 72 pixels.
; PLAN: r0=76(x), r1=174(y), r2=22(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 174
LDI r2, 22
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

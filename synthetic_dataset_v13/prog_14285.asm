; DESCRIPTION: Creates a green rectangular region at (139, 28) spanning 91 by 13 pixels.
; PLAN: r0=139(x), r1=28(y), r2=91(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 28
LDI r2, 91
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

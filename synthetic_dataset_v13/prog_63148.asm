; DESCRIPTION: Creates a green rectangular region at (130, 28) spanning 108 by 18 pixels.
; PLAN: r0=130(x), r1=28(y), r2=108(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 28
LDI r2, 108
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

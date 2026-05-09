; DESCRIPTION: Creates a yellow rectangular region at (462, 0) spanning 13 by 72 pixels.
; PLAN: r0=462(x), r1=0(y), r2=13(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 0
LDI r2, 13
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (24, 22) spanning 13 by 20 pixels.
; PLAN: r0=24(x), r1=22(y), r2=13(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 22
LDI r2, 13
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (280, 31) spanning 88 by 40 pixels.
; PLAN: r0=280(x), r1=31(y), r2=88(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 31
LDI r2, 88
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

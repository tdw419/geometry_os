; DESCRIPTION: Creates a green rectangular region at (402, 68) spanning 20 by 19 pixels.
; PLAN: r0=402(x), r1=68(y), r2=20(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 68
LDI r2, 20
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

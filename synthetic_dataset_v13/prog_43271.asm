; DESCRIPTION: Creates a green rectangular region at (402, 45) spanning 108 by 55 pixels.
; PLAN: r0=402(x), r1=45(y), r2=108(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 45
LDI r2, 108
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

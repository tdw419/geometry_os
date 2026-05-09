; DESCRIPTION: Creates a green rectangular region at (402, 80) spanning 53 by 12 pixels.
; PLAN: r0=402(x), r1=80(y), r2=53(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 80
LDI r2, 53
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

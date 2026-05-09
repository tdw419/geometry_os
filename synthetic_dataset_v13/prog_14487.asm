; DESCRIPTION: Creates a green rectangular region at (224, 185) spanning 53 by 34 pixels.
; PLAN: r0=224(x), r1=185(y), r2=53(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 185
LDI r2, 53
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

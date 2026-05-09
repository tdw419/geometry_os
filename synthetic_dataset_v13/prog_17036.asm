; DESCRIPTION: Creates a green rectangular region at (224, 212) spanning 108 by 29 pixels.
; PLAN: r0=224(x), r1=212(y), r2=108(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 212
LDI r2, 108
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

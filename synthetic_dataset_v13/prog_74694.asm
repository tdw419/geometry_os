; DESCRIPTION: Creates a green rectangular region at (224, 39) spanning 28 by 91 pixels.
; PLAN: r0=224(x), r1=39(y), r2=28(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 39
LDI r2, 28
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

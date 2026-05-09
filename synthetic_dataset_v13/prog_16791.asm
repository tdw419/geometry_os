; DESCRIPTION: Creates a blue rectangular region at (224, 26) spanning 52 by 70 pixels.
; PLAN: r0=224(x), r1=26(y), r2=52(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 26
LDI r2, 52
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT

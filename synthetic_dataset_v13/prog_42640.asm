; DESCRIPTION: Creates a white rectangular region at (224, 5) spanning 68 by 110 pixels.
; PLAN: r0=224(x), r1=5(y), r2=68(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 5
LDI r2, 68
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

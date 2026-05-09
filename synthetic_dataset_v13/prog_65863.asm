; DESCRIPTION: Creates a white rectangular region at (224, 2) spanning 12 by 20 pixels.
; PLAN: r0=224(x), r1=2(y), r2=12(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 2
LDI r2, 12
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

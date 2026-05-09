; DESCRIPTION: Creates a white rectangular region at (224, 168) spanning 65 by 55 pixels.
; PLAN: r0=224(x), r1=168(y), r2=65(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 168
LDI r2, 65
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

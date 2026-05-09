; DESCRIPTION: Creates a red rectangular region at (224, 86) spanning 115 by 58 pixels.
; PLAN: r0=224(x), r1=86(y), r2=115(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 86
LDI r2, 115
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

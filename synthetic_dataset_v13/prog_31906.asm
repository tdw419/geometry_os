; DESCRIPTION: Creates a red rectangular region at (224, 156) spanning 28 by 85 pixels.
; PLAN: r0=224(x), r1=156(y), r2=28(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 156
LDI r2, 28
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

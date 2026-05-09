; DESCRIPTION: Creates a red rectangular region at (463, 224) spanning 28 by 21 pixels.
; PLAN: r0=463(x), r1=224(y), r2=28(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 224
LDI r2, 28
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

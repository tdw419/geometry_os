; DESCRIPTION: Creates a red rectangular region at (145, 224) spanning 80 by 18 pixels.
; PLAN: r0=145(x), r1=224(y), r2=80(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 224
LDI r2, 80
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

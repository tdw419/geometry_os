; DESCRIPTION: Creates a green rectangular region at (348, 76) spanning 68 by 17 pixels.
; PLAN: r0=348(x), r1=76(y), r2=68(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 76
LDI r2, 68
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

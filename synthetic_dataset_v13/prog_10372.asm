; DESCRIPTION: Creates a green rectangular region at (348, 206) spanning 91 by 46 pixels.
; PLAN: r0=348(x), r1=206(y), r2=91(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 206
LDI r2, 91
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

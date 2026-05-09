; DESCRIPTION: Creates a green rectangular region at (203, 151) spanning 77 by 88 pixels.
; PLAN: r0=203(x), r1=151(y), r2=77(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 151
LDI r2, 77
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

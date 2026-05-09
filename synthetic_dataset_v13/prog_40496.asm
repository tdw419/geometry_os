; DESCRIPTION: Renders a green box of size 77x108 starting at (318, 73).
; PLAN: r0=318(x), r1=73(y), r2=77(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 73
LDI r2, 77
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

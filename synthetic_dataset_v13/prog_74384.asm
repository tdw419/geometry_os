; DESCRIPTION: Creates a green rectangular region at (194, 71) spanning 84 by 72 pixels.
; PLAN: r0=194(x), r1=71(y), r2=84(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 71
LDI r2, 84
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

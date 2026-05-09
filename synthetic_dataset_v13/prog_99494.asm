; DESCRIPTION: Creates a green rectangular region at (382, 54) spanning 91 by 114 pixels.
; PLAN: r0=382(x), r1=54(y), r2=91(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 54
LDI r2, 91
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (399, 49) spanning 46 by 90 pixels.
; PLAN: r0=399(x), r1=49(y), r2=46(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 49
LDI r2, 46
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

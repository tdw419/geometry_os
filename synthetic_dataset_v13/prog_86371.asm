; DESCRIPTION: Creates a green rectangular region at (23, 43) spanning 29 by 25 pixels.
; PLAN: r0=23(x), r1=43(y), r2=29(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 43
LDI r2, 29
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

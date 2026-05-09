; DESCRIPTION: Creates a green rectangular region at (334, 25) spanning 28 by 15 pixels.
; PLAN: r0=334(x), r1=25(y), r2=28(width), r3=15(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 25
LDI r2, 28
LDI r3, 15
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

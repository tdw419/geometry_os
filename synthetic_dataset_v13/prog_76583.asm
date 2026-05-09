; DESCRIPTION: Creates a green rectangular region at (430, 75) spanning 28 by 115 pixels.
; PLAN: r0=430(x), r1=75(y), r2=28(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 75
LDI r2, 28
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

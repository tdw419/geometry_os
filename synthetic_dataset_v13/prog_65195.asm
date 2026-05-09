; DESCRIPTION: Creates a green rectangular region at (430, 13) spanning 60 by 33 pixels.
; PLAN: r0=430(x), r1=13(y), r2=60(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 13
LDI r2, 60
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

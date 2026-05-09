; DESCRIPTION: Creates a green rectangular region at (430, 77) spanning 48 by 44 pixels.
; PLAN: r0=430(x), r1=77(y), r2=48(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 77
LDI r2, 48
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

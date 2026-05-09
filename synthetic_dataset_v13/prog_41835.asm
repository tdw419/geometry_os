; DESCRIPTION: Creates a green rectangular region at (430, 132) spanning 44 by 96 pixels.
; PLAN: r0=430(x), r1=132(y), r2=44(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 132
LDI r2, 44
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

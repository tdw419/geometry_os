; DESCRIPTION: Creates a yellow rectangular region at (89, 140) spanning 96 by 70 pixels.
; PLAN: r0=89(x), r1=140(y), r2=96(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 140
LDI r2, 96
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

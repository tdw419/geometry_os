; DESCRIPTION: Creates a yellow rectangular region at (234, 140) spanning 20 by 75 pixels.
; PLAN: r0=234(x), r1=140(y), r2=20(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 140
LDI r2, 20
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

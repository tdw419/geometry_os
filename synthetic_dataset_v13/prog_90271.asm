; DESCRIPTION: Creates a yellow rectangular region at (196, 26) spanning 106 by 89 pixels.
; PLAN: r0=196(x), r1=26(y), r2=106(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 26
LDI r2, 106
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

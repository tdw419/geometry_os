; DESCRIPTION: Creates a yellow rectangular region at (148, 145) spanning 100 by 20 pixels.
; PLAN: r0=148(x), r1=145(y), r2=100(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 145
LDI r2, 100
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

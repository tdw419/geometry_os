; DESCRIPTION: Creates a yellow rectangular region at (177, 145) spanning 10 by 99 pixels.
; PLAN: r0=177(x), r1=145(y), r2=10(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 145
LDI r2, 10
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

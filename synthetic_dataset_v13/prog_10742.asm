; DESCRIPTION: Creates a green rectangular region at (312, 87) spanning 81 by 46 pixels.
; PLAN: r0=312(x), r1=87(y), r2=81(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 87
LDI r2, 81
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

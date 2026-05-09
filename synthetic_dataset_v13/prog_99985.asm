; DESCRIPTION: Creates a yellow rectangular region at (181, 105) spanning 77 by 23 pixels.
; PLAN: r0=181(x), r1=105(y), r2=77(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 105
LDI r2, 77
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (26, 3) spanning 56 by 66 pixels.
; PLAN: r0=26(x), r1=3(y), r2=56(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 3
LDI r2, 56
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

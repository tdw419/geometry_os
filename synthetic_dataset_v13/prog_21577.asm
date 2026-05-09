; DESCRIPTION: Creates a yellow rectangular region at (40, 167) spanning 87 by 33 pixels.
; PLAN: r0=40(x), r1=167(y), r2=87(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 167
LDI r2, 87
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

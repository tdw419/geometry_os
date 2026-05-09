; DESCRIPTION: Creates a yellow rectangular region at (444, 102) spanning 45 by 40 pixels.
; PLAN: r0=444(x), r1=102(y), r2=45(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 102
LDI r2, 45
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (102, 2) spanning 101 by 52 pixels.
; PLAN: r0=102(x), r1=2(y), r2=101(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 2
LDI r2, 101
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

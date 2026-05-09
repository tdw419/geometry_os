; DESCRIPTION: Creates a yellow rectangular region at (102, 153) spanning 77 by 10 pixels.
; PLAN: r0=102(x), r1=153(y), r2=77(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 153
LDI r2, 77
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

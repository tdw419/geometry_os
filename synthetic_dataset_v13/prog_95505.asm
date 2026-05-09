; DESCRIPTION: Creates a black rectangular region at (102, 2) spanning 118 by 80 pixels.
; PLAN: r0=102(x), r1=2(y), r2=118(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 2
LDI r2, 118
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

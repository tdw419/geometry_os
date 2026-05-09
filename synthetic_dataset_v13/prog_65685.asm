; DESCRIPTION: Creates a yellow rectangular region at (153, 5) spanning 25 by 34 pixels.
; PLAN: r0=153(x), r1=5(y), r2=25(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 5
LDI r2, 25
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

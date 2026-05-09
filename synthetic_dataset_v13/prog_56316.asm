; DESCRIPTION: Creates a yellow rectangular region at (339, 0) spanning 120 by 33 pixels.
; PLAN: r0=339(x), r1=0(y), r2=120(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 0
LDI r2, 120
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

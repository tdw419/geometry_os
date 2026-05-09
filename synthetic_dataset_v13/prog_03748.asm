; DESCRIPTION: Creates a yellow rectangular region at (261, 1) spanning 52 by 15 pixels.
; PLAN: r0=261(x), r1=1(y), r2=52(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 1
LDI r2, 52
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

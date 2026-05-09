; DESCRIPTION: Creates a yellow rectangular region at (338, 8) spanning 114 by 54 pixels.
; PLAN: r0=338(x), r1=8(y), r2=114(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 8
LDI r2, 114
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

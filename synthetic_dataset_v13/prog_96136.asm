; DESCRIPTION: Creates a yellow rectangular region at (252, 54) spanning 100 by 39 pixels.
; PLAN: r0=252(x), r1=54(y), r2=100(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 54
LDI r2, 100
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (339, 101) spanning 21 by 36 pixels.
; PLAN: r0=339(x), r1=101(y), r2=21(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 101
LDI r2, 21
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

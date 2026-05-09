; DESCRIPTION: Creates a green rectangular region at (20, 139) spanning 101 by 98 pixels.
; PLAN: r0=20(x), r1=139(y), r2=101(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 139
LDI r2, 101
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a green rectangular region at (39, 111) spanning 88 by 101 pixels.
; PLAN: r0=39(x), r1=111(y), r2=88(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 111
LDI r2, 88
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT

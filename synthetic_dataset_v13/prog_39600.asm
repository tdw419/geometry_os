; DESCRIPTION: Creates a yellow rectangular region at (52, 136) spanning 38 by 13 pixels.
; PLAN: r0=52(x), r1=136(y), r2=38(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 136
LDI r2, 38
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

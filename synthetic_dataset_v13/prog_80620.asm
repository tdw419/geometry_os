; DESCRIPTION: Creates a yellow rectangular region at (377, 110) spanning 16 by 52 pixels.
; PLAN: r0=377(x), r1=110(y), r2=16(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 110
LDI r2, 16
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

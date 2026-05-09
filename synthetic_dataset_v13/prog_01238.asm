; DESCRIPTION: Creates a yellow rectangular region at (359, 36) spanning 80 by 52 pixels.
; PLAN: r0=359(x), r1=36(y), r2=80(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 36
LDI r2, 80
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

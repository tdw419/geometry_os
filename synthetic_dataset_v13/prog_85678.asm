; DESCRIPTION: Creates a yellow rectangular region at (254, 81) spanning 37 by 59 pixels.
; PLAN: r0=254(x), r1=81(y), r2=37(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 81
LDI r2, 37
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

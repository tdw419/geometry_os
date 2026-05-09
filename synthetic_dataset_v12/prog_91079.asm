; DESCRIPTION: Creates a yellow rectangular region at (117, 1) spanning 81 by 108 pixels.
; PLAN: r0=117(x), r1=1(y), r2=81(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 1
LDI r2, 81
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

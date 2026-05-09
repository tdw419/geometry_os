; DESCRIPTION: Creates a yellow rectangular region at (117, 185) spanning 108 by 54 pixels.
; PLAN: r0=117(x), r1=185(y), r2=108(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 185
LDI r2, 108
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

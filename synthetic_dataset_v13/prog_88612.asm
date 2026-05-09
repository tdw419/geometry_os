; DESCRIPTION: Creates a yellow rectangular region at (69, 80) spanning 43 by 74 pixels.
; PLAN: r0=69(x), r1=80(y), r2=43(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 80
LDI r2, 43
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

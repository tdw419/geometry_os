; DESCRIPTION: Creates a yellow rectangular region at (20, 58) spanning 90 by 108 pixels.
; PLAN: r0=20(x), r1=58(y), r2=90(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 58
LDI r2, 90
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

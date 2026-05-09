; DESCRIPTION: Creates a yellow rectangular region at (261, 65) spanning 38 by 116 pixels.
; PLAN: r0=261(x), r1=65(y), r2=38(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 65
LDI r2, 38
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

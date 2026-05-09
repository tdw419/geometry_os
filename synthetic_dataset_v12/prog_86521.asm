; DESCRIPTION: Creates a yellow rectangular region at (285, 127) spanning 78 by 55 pixels.
; PLAN: r0=285(x), r1=127(y), r2=78(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 127
LDI r2, 78
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (285, 109) spanning 49 by 78 pixels.
; PLAN: r0=285(x), r1=109(y), r2=49(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 109
LDI r2, 49
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

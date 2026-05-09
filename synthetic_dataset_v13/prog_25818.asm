; DESCRIPTION: Creates a yellow rectangular region at (200, 142) spanning 49 by 27 pixels.
; PLAN: r0=200(x), r1=142(y), r2=49(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 142
LDI r2, 49
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

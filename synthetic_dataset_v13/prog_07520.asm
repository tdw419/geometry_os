; DESCRIPTION: Creates a yellow rectangular region at (40, 148) spanning 96 by 57 pixels.
; PLAN: r0=40(x), r1=148(y), r2=96(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 148
LDI r2, 96
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

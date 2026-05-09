; DESCRIPTION: Creates a yellow rectangular region at (73, 17) spanning 73 by 37 pixels.
; PLAN: r0=73(x), r1=17(y), r2=73(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 17
LDI r2, 73
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

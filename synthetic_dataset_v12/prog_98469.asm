; DESCRIPTION: Creates a yellow rectangular region at (17, 55) spanning 57 by 36 pixels.
; PLAN: r0=17(x), r1=55(y), r2=57(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 55
LDI r2, 57
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

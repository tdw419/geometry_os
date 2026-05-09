; DESCRIPTION: Creates a yellow rectangular region at (347, 28) spanning 55 by 18 pixels.
; PLAN: r0=347(x), r1=28(y), r2=55(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 28
LDI r2, 55
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (332, 190) spanning 55 by 46 pixels.
; PLAN: r0=332(x), r1=190(y), r2=55(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 190
LDI r2, 55
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

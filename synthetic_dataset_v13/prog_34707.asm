; DESCRIPTION: Creates a yellow rectangular region at (238, 46) spanning 96 by 84 pixels.
; PLAN: r0=238(x), r1=46(y), r2=96(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 46
LDI r2, 96
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

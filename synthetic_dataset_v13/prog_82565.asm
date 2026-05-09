; DESCRIPTION: Creates a yellow rectangular region at (250, 38) spanning 18 by 98 pixels.
; PLAN: r0=250(x), r1=38(y), r2=18(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 38
LDI r2, 18
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

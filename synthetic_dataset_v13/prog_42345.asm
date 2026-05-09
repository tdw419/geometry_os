; DESCRIPTION: Creates a yellow rectangular region at (282, 29) spanning 75 by 83 pixels.
; PLAN: r0=282(x), r1=29(y), r2=75(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 29
LDI r2, 75
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

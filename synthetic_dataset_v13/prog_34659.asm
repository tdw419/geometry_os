; DESCRIPTION: Creates a yellow rectangular region at (184, 15) spanning 99 by 100 pixels.
; PLAN: r0=184(x), r1=15(y), r2=99(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 15
LDI r2, 99
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

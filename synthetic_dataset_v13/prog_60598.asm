; DESCRIPTION: Creates a yellow rectangular region at (219, 26) spanning 74 by 84 pixels.
; PLAN: r0=219(x), r1=26(y), r2=74(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 26
LDI r2, 74
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

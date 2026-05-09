; DESCRIPTION: Creates a yellow rectangular region at (219, 230) spanning 19 by 26 pixels.
; PLAN: r0=219(x), r1=230(y), r2=19(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 230
LDI r2, 19
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (144, 198) spanning 34 by 45 pixels.
; PLAN: r0=144(x), r1=198(y), r2=34(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 198
LDI r2, 34
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

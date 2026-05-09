; DESCRIPTION: Creates a black rectangular region at (219, 19) spanning 109 by 26 pixels.
; PLAN: r0=219(x), r1=19(y), r2=109(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 19
LDI r2, 109
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

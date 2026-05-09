; DESCRIPTION: Creates a black rectangular region at (253, 6) spanning 17 by 118 pixels.
; PLAN: r0=253(x), r1=6(y), r2=17(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 6
LDI r2, 17
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

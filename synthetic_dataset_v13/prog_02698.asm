; DESCRIPTION: Creates a black rectangular region at (159, 104) spanning 74 by 101 pixels.
; PLAN: r0=159(x), r1=104(y), r2=74(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 104
LDI r2, 74
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

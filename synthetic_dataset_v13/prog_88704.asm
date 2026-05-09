; DESCRIPTION: Creates a black rectangular region at (170, 72) spanning 104 by 88 pixels.
; PLAN: r0=170(x), r1=72(y), r2=104(width), r3=88(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 72
LDI r2, 104
LDI r3, 88
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a black rectangular region at (118, 148) spanning 20 by 104 pixels.
; PLAN: r0=118(x), r1=148(y), r2=20(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 148
LDI r2, 20
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

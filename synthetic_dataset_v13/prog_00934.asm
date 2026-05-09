; DESCRIPTION: Creates a black rectangular region at (153, 119) spanning 104 by 120 pixels.
; PLAN: r0=153(x), r1=119(y), r2=104(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 119
LDI r2, 104
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

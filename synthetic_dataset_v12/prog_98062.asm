; DESCRIPTION: Creates a black rectangular region at (70, 104) spanning 114 by 83 pixels.
; PLAN: r0=70(x), r1=104(y), r2=114(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 104
LDI r2, 114
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

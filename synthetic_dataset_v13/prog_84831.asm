; DESCRIPTION: Creates a black rectangular region at (70, 104) spanning 84 by 52 pixels.
; PLAN: r0=70(x), r1=104(y), r2=84(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 104
LDI r2, 84
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

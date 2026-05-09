; DESCRIPTION: Creates a black rectangular region at (328, 70) spanning 118 by 83 pixels.
; PLAN: r0=328(x), r1=70(y), r2=118(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 70
LDI r2, 118
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

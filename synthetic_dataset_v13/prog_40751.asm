; DESCRIPTION: Creates a black rectangular region at (173, 198) spanning 118 by 54 pixels.
; PLAN: r0=173(x), r1=198(y), r2=118(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 198
LDI r2, 118
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

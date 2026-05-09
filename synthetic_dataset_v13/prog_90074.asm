; DESCRIPTION: Creates a black rectangular region at (173, 142) spanning 35 by 98 pixels.
; PLAN: r0=173(x), r1=142(y), r2=35(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 142
LDI r2, 35
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

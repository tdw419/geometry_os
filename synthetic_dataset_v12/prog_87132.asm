; DESCRIPTION: Creates a black rectangular region at (184, 142) spanning 21 by 49 pixels.
; PLAN: r0=184(x), r1=142(y), r2=21(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 142
LDI r2, 21
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

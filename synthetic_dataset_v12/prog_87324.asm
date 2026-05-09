; DESCRIPTION: Creates a black rectangular region at (452, 113) spanning 55 by 85 pixels.
; PLAN: r0=452(x), r1=113(y), r2=55(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 113
LDI r2, 55
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

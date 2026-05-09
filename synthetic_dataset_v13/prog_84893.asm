; DESCRIPTION: Creates a black rectangular region at (141, 125) spanning 120 by 84 pixels.
; PLAN: r0=141(x), r1=125(y), r2=120(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 125
LDI r2, 120
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

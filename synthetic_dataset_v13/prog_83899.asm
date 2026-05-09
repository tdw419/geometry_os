; DESCRIPTION: Creates a black rectangular region at (429, 136) spanning 57 by 99 pixels.
; PLAN: r0=429(x), r1=136(y), r2=57(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 136
LDI r2, 57
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

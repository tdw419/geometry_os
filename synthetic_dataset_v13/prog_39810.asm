; DESCRIPTION: Creates a yellow rectangular region at (429, 3) spanning 74 by 119 pixels.
; PLAN: r0=429(x), r1=3(y), r2=74(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 3
LDI r2, 74
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

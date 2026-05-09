; DESCRIPTION: Creates a black rectangular region at (142, 180) spanning 89 by 11 pixels.
; PLAN: r0=142(x), r1=180(y), r2=89(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 180
LDI r2, 89
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

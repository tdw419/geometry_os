; DESCRIPTION: Creates a black rectangular region at (443, 57) spanning 17 by 89 pixels.
; PLAN: r0=443(x), r1=57(y), r2=17(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 57
LDI r2, 17
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

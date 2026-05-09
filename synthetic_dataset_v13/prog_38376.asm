; DESCRIPTION: Creates a black rectangular region at (89, 70) spanning 70 by 68 pixels.
; PLAN: r0=89(x), r1=70(y), r2=70(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 70
LDI r2, 70
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

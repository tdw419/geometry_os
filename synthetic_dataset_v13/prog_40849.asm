; DESCRIPTION: Creates a black rectangular region at (54, 79) spanning 89 by 103 pixels.
; PLAN: r0=54(x), r1=79(y), r2=89(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 79
LDI r2, 89
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT

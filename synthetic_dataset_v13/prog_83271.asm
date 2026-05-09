; DESCRIPTION: Creates a yellow rectangular region at (411, 79) spanning 85 by 31 pixels.
; PLAN: r0=411(x), r1=79(y), r2=85(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 79
LDI r2, 85
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

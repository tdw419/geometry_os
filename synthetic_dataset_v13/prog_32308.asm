; DESCRIPTION: Creates a orange rectangular region at (300, 115) spanning 89 by 116 pixels.
; PLAN: r0=300(x), r1=115(y), r2=89(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 115
LDI r2, 89
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

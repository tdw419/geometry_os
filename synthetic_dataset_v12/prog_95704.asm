; DESCRIPTION: Creates a orange rectangular region at (325, 49) spanning 106 by 120 pixels.
; PLAN: r0=325(x), r1=49(y), r2=106(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 49
LDI r2, 106
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

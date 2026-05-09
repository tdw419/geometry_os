; DESCRIPTION: Creates a orange rectangular region at (61, 2) spanning 106 by 30 pixels.
; PLAN: r0=61(x), r1=2(y), r2=106(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 2
LDI r2, 106
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

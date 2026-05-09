; DESCRIPTION: Creates a orange rectangular region at (208, 2) spanning 115 by 85 pixels.
; PLAN: r0=208(x), r1=2(y), r2=115(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 2
LDI r2, 115
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

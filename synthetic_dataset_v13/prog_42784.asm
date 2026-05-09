; DESCRIPTION: Creates a orange rectangular region at (195, 71) spanning 101 by 35 pixels.
; PLAN: r0=195(x), r1=71(y), r2=101(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 71
LDI r2, 101
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (195, 71) spanning 78 by 75 pixels.
; PLAN: r0=195(x), r1=71(y), r2=78(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 71
LDI r2, 78
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a orange rectangular region at (314, 98) spanning 98 by 106 pixels.
; PLAN: r0=314(x), r1=98(y), r2=98(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 98
LDI r2, 98
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

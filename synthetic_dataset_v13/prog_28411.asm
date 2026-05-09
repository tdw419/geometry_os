; DESCRIPTION: Creates a orange rectangular region at (341, 110) spanning 98 by 73 pixels.
; PLAN: r0=341(x), r1=110(y), r2=98(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 110
LDI r2, 98
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

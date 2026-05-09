; DESCRIPTION: Creates a orange rectangular region at (424, 47) spanning 11 by 106 pixels.
; PLAN: r0=424(x), r1=47(y), r2=11(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 47
LDI r2, 11
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

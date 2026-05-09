; DESCRIPTION: Creates a orange rectangular region at (47, 47) spanning 105 by 98 pixels.
; PLAN: r0=47(x), r1=47(y), r2=105(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 47
LDI r2, 105
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT

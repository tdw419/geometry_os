; DESCRIPTION: Creates a red rectangular region at (4, 105) spanning 106 by 45 pixels.
; PLAN: r0=4(x), r1=105(y), r2=106(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 105
LDI r2, 106
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

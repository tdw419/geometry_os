; DESCRIPTION: Creates a red rectangular region at (357, 105) spanning 87 by 10 pixels.
; PLAN: r0=357(x), r1=105(y), r2=87(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 105
LDI r2, 87
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a white rectangular region at (190, 100) spanning 91 by 106 pixels.
; PLAN: r0=190(x), r1=100(y), r2=91(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 100
LDI r2, 91
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

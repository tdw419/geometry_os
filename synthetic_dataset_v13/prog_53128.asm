; DESCRIPTION: Creates a white rectangular region at (190, 6) spanning 29 by 102 pixels.
; PLAN: r0=190(x), r1=6(y), r2=29(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 6
LDI r2, 29
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT

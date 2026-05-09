; DESCRIPTION: Creates a yellow rectangular region at (190, 148) spanning 87 by 105 pixels.
; PLAN: r0=190(x), r1=148(y), r2=87(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 148
LDI r2, 87
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

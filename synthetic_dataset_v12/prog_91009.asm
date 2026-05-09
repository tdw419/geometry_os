; DESCRIPTION: Creates a yellow rectangular region at (190, 185) spanning 98 by 33 pixels.
; PLAN: r0=190(x), r1=185(y), r2=98(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 185
LDI r2, 98
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

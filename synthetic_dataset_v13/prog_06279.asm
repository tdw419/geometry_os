; DESCRIPTION: Creates a yellow rectangular region at (190, 162) spanning 107 by 19 pixels.
; PLAN: r0=190(x), r1=162(y), r2=107(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 162
LDI r2, 107
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

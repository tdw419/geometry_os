; DESCRIPTION: Creates a yellow rectangular region at (183, 106) spanning 47 by 94 pixels.
; PLAN: r0=183(x), r1=106(y), r2=47(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 106
LDI r2, 47
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT

; DESCRIPTION: Creates a yellow rectangular region at (47, 29) spanning 31 by 109 pixels.
; PLAN: r0=47(x), r1=29(y), r2=31(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 29
LDI r2, 31
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
